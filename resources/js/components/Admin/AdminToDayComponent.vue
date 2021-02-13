<template>
  <div class="row">
    <div class="col-md-12">
    <adminwidget :data="items.data"></adminwidget>
      <pagination-component
        :data="items"
        @pagination-change-page="getData"
      ></pagination-component>
    </div>
  </div>
</template> 

<script>
export default {
  mounted() {},
  data() {
    return {
      items: {
        data: [],
      },
    };
  },
  created() {
    this.getData();
  },
  methods: {
    getData(page) {
      if (typeof page == "undefined") page = 1;
      axios
        .get(`http://127.0.0.1:8000/api/admin/list-today?page=${page}`)
        .then((res) => {
            this.items = res.data;
        });
    },
  },
};
</script>

<style>
</style>