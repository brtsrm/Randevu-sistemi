<template>
  <div class="row">
    <adminworking
      day="Monday"
      @add="add"
      title="Pazartesi"
      :data="Monday"
    ></adminworking>
    <adminworking
      day="Tuesday"
      @add="add"
      title="Salı"
      :data="Tuesday"
    ></adminworking>
    <adminworking
      day="Wednesday"
      @add="add"
      title="Çarşamba"
      :data="Wednesday"
    ></adminworking>
    <adminworking
      day="Thursday"
      @add="add"
      title="Perşembe"
      :data="Thursday"
    ></adminworking>
    <adminworking
      day="Friday"
      @add="add"
      title="Cuma"
      :data="Friday"
    ></adminworking>
    <adminworking
      day="Saturday"
      @add="add"
      title="Cumartesi"
      :data="Saturday"
    ></adminworking>
    <adminworking
      day="Sunday"
      @add="add"
      title="Pazar"
      :data="Sunday"
    ></adminworking>
    <button @click="store" class="btn btn-success float-right">Ekle</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      Monday: [],
      Tuesday: [],
      Wednesday: [],
      Thursday: [],
      Friday: [],
      Saturday: [],
      Sunday: [],
    };
  },
  created() {
    axios.get(`http://127.0.0.1:8000/api/working-list`).then((res) => {
      this.Monday =
        typeof res.data.Monday !== "undefined" ? res.data.Monday : [];
      this.Tuesday =
        typeof res.data.Tuesday !== "undefined" ? res.data.Tuesday : [];
      this.Wednesday =
        typeof res.data.Wednesday !== "undefined" ? res.data.Wednesday : [];
      this.Thursday =
        typeof res.data.Thursday !== "undefined" ? res.data.Thursday : [];
      this.Friday =
        typeof res.data.Friday !== "undefined" ? res.data.Friday : [];
      this.Saturday =
        typeof res.data.Saturday !== "undefined" ? res.data.Saturday : [];
      this.Sunday =
        typeof res.data.Sunday !== "undefined" ? res.data.Sunday : [];
    });
  },
  methods: {
    add: function (data) {
      this[data.day].push(data.text);
    },
    store: function () {
      axios
        .post("http://127.0.0.1:8000/api/working-store", {
          Monday: this.Monday,
          Tuesday: this.Tuesday,
          Wednesday: this.Wednesday,
          Thursday: this.Thursday,
          Friday: this.Friday,
          Saturday: this.Saturday,
          Sunday: this.Sunday,
        })
        .then((res) => {
          if (res.data.status == "succes") {
            this.$vToastify.success(
              "Veri başarılı bir şekilde eklenmiştir",
              ""
            );
          }
        });
    },
  },
};
</script>

<style>
</style>