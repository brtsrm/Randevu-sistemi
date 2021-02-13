<template>
  
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
        .get(`http://127.0.0.1:8000/api/admin/list?page=${page}`)
        .then((res) => {
          this.items = res.data;
        });
    },
  },
};
</script>

<style>
</style>