<template>
  <div class="row">
    <div v-for="(item, index) in data" :key="item.id" class="col-md-3 mb-3">
      <div class="card text-center">
        <div class="card-header">
          Randevu #{{ index }}
          <span class="bg-info btn float-right" v-if="item.isStatu == 0"
            >Yeni</span>
          <span class="bg-success btn float-right" v-if="item.isStatu == 1"
            >Onaylı</span>
          <span class="bg-warning btn float-right" v-if="item.isStatu == 2"
            >İptal</span>
        </div>
        <div class="card-body">
          <h5 class="card-title m-0">{{ item.fullName }}</h5>
        </div>
        <div class="card-footer">
          {{ item.working_hous.hours }} - {{ item.tarih }}
        </div>
        
        <div v-if="!item.isStatu ">
          <button @click="appoitnmentOkey(item.id)" class="btn btn-success">
            Onayla
          </button>
          <button @click="appoitnmentCancel(item.id)" class="btn btn-danger">
            İptal Et
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["data"],
    

  methods: {
    appoitnmentCancel(id) {
      alert(id);
    },
    appoitnmentOkey(id){
      this.$emit("updateOkey",id); 
    }
  },
};
</script>


<style>
</style>