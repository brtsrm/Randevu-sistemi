<template>
  <div class="card w-100 ml-3 mb-3">
    <div class="card-header">
      {{ title }}
      <button class="btn btn-primary float-right" @click="showClick">+</button>
    </div>
    <div v-if="isShow">
      <h5 class="card-title">Süre Ekleme</h5>
      <p class="card-text">
        <input v-model="time" type="text" class="form-control" />
        <button @click="addTime()" class="btn btn-success mt-3">Ekle</button>
      </p>
    </div>

    <div class="card-body">
      <div v-for="item in data">{{ item }}</div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["title", "data", "day"],
  data() {
    return {
      isShow: false,
      time: "",
    };
  },
  methods: {
    showClick: function () {
      this.isShow = !this.isShow;
    },
    addTime: function () {
      this.$emit("add", { text: this.time, day: this.day });
      this.isShow = false;
      this.time = "";
    },
  },
};
</script>

<style>
</style>