require('./bootstrap');
import VueMask from 'v-mask';
import VueToastify from "vue-toastify";
import VueResource from 'vue-resource';

window.Vue = require('vue');

Vue.use(VueMask)
Vue.use(VueResource)
Vue.use(VueToastify, {
    theme: "light",
    position: "top-right",
    warningInfoDuration: 2000,

    icon: '<svg width="50" height="50">\n' +
        '<rect width="50" height="50" style="fill:rgb(0,0,255);" />\n' +
        '</svg> ',
});

let Ip = `http://127.0.0.1:8000/api`;

Vue.component('adminwidget', require('./widget/adminwidget.vue').default);
Vue.component('randevuform-component', require('./components/RandeveFormComponent.vue').default);
Vue.component('admin-component', require('./components/AdminComponents.vue').default);
Vue.component('admincomponent-component', require('./components/Admin/AdminComponent.vue').default);
Vue.component('admintodaycomponent-component', require('./components/Admin/AdminToDayComponent.vue').default);
Vue.component('adminlastdaycomponent-component', require('./components/Admin/AdminLastDayComponent.vue').default);
Vue.component('pagination-component', require('laravel-vue-pagination'));
Vue.component('adminappointmentwaitingcomponent-component', require('./components/Admin/AdminAppointmentWaitingComponent').default);
Vue.component('adminworking-component', require('./components/Admin/AdminWorkingComponent.vue').default);
Vue.component('adminworking', require('./widget/adminworking.vue').default);


const app = new Vue({
    el: '#app',
});