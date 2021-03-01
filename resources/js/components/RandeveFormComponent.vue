<template>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="form-group">
          <input
            type="text"
            class="form-control"
            v-model="name"
            placeholder="Ad soyad"
            name=""
            id=""
          />
        </div>
      </div>
      <div class="col-md-12">
        <div class="form-group">
          <input
            type="text"
            class="form-control"
            v-model="email"
            placeholder="Email"
            name=""
            id=""
          />
        </div>
      </div>
      <div class="col-md-12">
        <div class="form-group">
          <input
            type="text"
            class="form-control"
            v-model="phone"
            placeholder="Cep Telefon"
            v-mask="'###-###-##-##'"
            name=""
            id=""
          />
        </div>
      </div>
      <div class="col-md-12">
        <div class="form-group">
          <input
            type="date"
            v-model="date"
            :min="minDate"
            @change="selectDate"
            class="form-control"
            name=""
            id=""
          />
        </div>
      </div>
      <!--Randevuların Oluşturuğu Kart Başlama-->
      <div class="col-md-12">
        <div class="row">
          <div
            v-for="(item, index) in workingHours"
            :key="index"
            class="col-md-3 mb-3"
          >
            <div class="card text-left mr-1">
              <label class="form-check-label">
                <div class="card-body">
                  <p class="card-text"></p>
                  <div class="form-check form-check-inline">
                    <input
                      v-if="!item.isActive"
                      class="form-check-input"
                      type="radio"
                      name=""
                      id=""
                      v-bind:value="item.id"
                      v-model="workingHour"
                    />

                    <div class="clearfix"></div>
                  </div>
                  <span class="col-md-12 text-danger" v-if="item.isActive"
                    >Bu Saate Dolu</span
                  >
                  <p>{{ item.hours }}</p>
                </div>
              </label>
            </div>
          </div>
        </div>
        <!--Randevuların Oluşturuğu Kart Sonu-->

        <!--Randevu Bilgilendirme Kart Başla-->
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-body">
                <h3 class="card-title text-center">Bilgilendirme</h3>
              </div>
            </div>
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-md-3 mb-3">
            <div class="card text-left mr-1">
              <label class="form-check-label">
                <div class="card-body">
                  <p class="card-text"></p>
                  <div class="form-check form-check-inline">
                    <input
                      class="form-check-input"
                      type="radio"
                      name=""
                      id=""
                      v-bind:value="1"
                      v-model="notifactionType"
                    />
                  </div>
                  Email aa
                  <p></p>
                </div>
              </label>
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <div class="card text-left mr-1">
              <label class="form-check-label">
                <div class="card-body">
                  <p class="card-text"></p>
                  <div class="form-check form-check-inline">
                    <input
                      class="form-check-input"
                      type="radio"
                      name=""
                      id=""
                      v-bind:value="2"
                      v-model="notifactionType"
                    />
                  </div>
                  Sms
                  <p></p>
                </div>
              </label>
            </div>
          </div>
        </div>
        <!--Randevu Bilgilendirme Kart Başla-->
        <!--Randevu Kartın Açıklama Başlama -->
        <div class="form-group">
          <textarea
            v-model="text"
            class="form-control"
            name=""
            id=""
            rows="10"
          ></textarea>
        </div>
        <!--Randevu Kartın Açıklama Son -->
        <button
          type="button"
          name=""
          id=""
          v-on:click="store"
          class="btn btn-success btn-lg btn-block"
        >
          Kaydet
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import io from "socket.io-client";
var socket = io("http://localhost:4000");
export default {
  data() {
    return {
      errors: [],
      name: null,
      email: null,
      workingHour: 0,
      phone: null,
      text: null,
      notifactionType: null,
      minDate: new Date().toISOString().slice(0, 10),
      date: new Date().toISOString().slice(0, 10),
      workingHours: [],
    };
  },
  mounted() {
    axios.get("http://127.0.0.1:8000/api/working-hours").then((res) => {
      this.workingHours = res.data;
    });
  },
  methods: {
    store() {
      if (
        this.name &&
        this.email &&
        this.validEmail(this.email) &&
        this.phone &&
        this.notifactionType &&
        this.workingHour
      ) {
        axios
          .post(`http://127.0.0.1:8000/api/appointment-store/`, {
            fullName: this.name,
            phone: this.phone,
            email: this.email,
            date: this.date,
            workingHour: this.workingHour,
            text: this.text,
            notification_type: this.notifactionType,
          })
          .then((res) => {
            socket.emit("new_appointment_create");
            this.$vToastify.info(res.data.message, "");
          });
      }
      this.errors = [];
      if (!this.name) {
        this.$vToastify.warning("Adı Soyadı Boş Olamaz", "Hata");
      }
      if (!this.email || !this.validEmail(this.email)) {
        this.$vToastify.warning(
          "Mail Adresi Boş Olamaz veya Doğru girilmesi lazım ",
          "Hata"
        );
      }
      if (!this.phone) {
        this.$vToastify.warning("Telefon  Boş Olamaz  ", "Hata");
      }
      if (!this.workingHour) {
        this.$vToastify.warning("Çalışma Saati Boş Olamaz ", "Hata");
      }
      if (!this.notifactionType) {
        this.$vToastify.warning("Bilgilendirme Türünü Seçin ", "Hata");
      }
    },
    selectDate() {
      axios
        .get(`http://127.0.0.1:8000/api/working-hours/${this.date}`)
        .then((res) => {
          this.workingHours = res.data;
        });
    },

    validEmail: function (email) {
      var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return re.test(email);
    },
  },
};
</script>

<style>
</style>