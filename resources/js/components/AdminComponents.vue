<template>
  <div class="container">
    <nav>
      <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <a
          class="nav-item nav-link"
          id="nav-beklenen-tab"
          data-toggle="tab"
          href="#nav-beklenen"
          role="tab"
          aria-controls="nav-beklenen"
          aria-selected="true"
          >Beklenen Rezervasyon</a
        >

        <a
          class="nav-item nav-link active"
          id="nav-admintodaycomponent-tab"
          data-toggle="tab"
          href="#nav-admintodaycomponent"
          role="tab"
          aria-controls="nav-admintodaycomponent"
          aria-selected="true"
          >Günü Gelen Randevular</a
        >

        <a
          class="nav-item nav-link"
          id="nav-admincomponent-tab"
          data-toggle="tab"
          href="#nav-admincomponent"
          role="tab"
          aria-controls="nav-admincomponent"
          aria-selected="false"
          >Gelecek Randevula</a
        >

        <a
          class="nav-item nav-link"
          id="nav-adminlastdaycomponent-tab"
          data-toggle="tab"
          href="#nav-adminlastdaycomponent"
          role="tab"
          aria-controls="nav-adminlastdaycomponent"
          aria-selected="false"
          >Geçmiş Randevular</a
        >
      </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
      <div class="tab-content" id="nav-tabContent">
        <div
          class="tab-pane fade show active"
          id="nav-admintodaycomponent"
          role="tabpanel"
          aria-labelledby="nav-admintodaycomponent-tab"
        >
          <div class="row">
            <div class="col-md-12">
              <adminwidget :data="today.data"></adminwidget>
              <pagination-component
                :data="today"
                @pagination-change-page="getData"
              ></pagination-component>
            </div>
          </div>
        </div>
        <div
          class="tab-pane fade"
          id="nav-beklenen"
          role="tabpanel"
          aria-labelledby="nav-beklenen-tab"
        >
          <div class="row">
            <div class="col-md-12">
              <adminwidget
                @updateOkey="updateOkey"
                :data="waiting.data"
              ></adminwidget>
              <pagination-component
                :data="waiting"
                @pagination-change-page="getData"
              ></pagination-component>
            </div>
          </div>
        </div>
        <div
          class="tab-pane fade"
          id="nav-admincomponent"
          role="tabpanel"
          aria-labelledby="nav-admincomponent-tab"
        >
          <div class="row">
            <div class="col-md-12">
              <adminwidget :data="list.data"></adminwidget>
              <pagination-component
                :data="list"
                @pagination-change-page="getData"
              ></pagination-component>
            </div>
          </div>
        </div>
        <div
          class="tab-pane fade"
          id="nav-adminlastdaycomponent"
          role="tabpanel"
          aria-labelledby="nav-adminlastdaycomponent-tab"
        >
          <div class="row">
            <div class="col-md-12">
              <adminwidget :data="last.data"></adminwidget>
              <pagination-component
                :data="last"
                @pagination-change-page="getData"
              ></pagination-component>
            </div>
          </div>
        </div>
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
      waiting: {
        data: [],
      },
      list: {
        data: [],
      },
      today: {
        data: [],
      },
      last: {
        data: [],
      },
    };
  },
  created() {
    this.getData();
    socket.on("admin_appointment_list", () => {
      this.getData();
    });
  },
  methods: {
    updateOkey(id) {
      axios
        .post("http://127.0.0.1:8000/api/admin/process", {
          type: 1,
          id: id,
        })
        .then((res) => {
          this.getData();
        });
    },
    getData(page) {
      if (typeof page == "undefined") page = 1;
      axios
        .get(`http://127.0.0.1:8000/api/admin/all?page=${page}`)
        .then((res) => {
          this.waiting = res.data.waiting;
          this.list = res.data.list;
          this.today = res.data.today;
          this.last = res.data.last;
        });
    },
  },
};
</script>