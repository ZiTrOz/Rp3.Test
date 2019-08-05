// import Vue from 'vue'
// import App from './App.vue'

// new Vue({
//   el: '#app',
//   render: h => h(App)
// })

import Vue from 'vue';
import axios from 'axios';

import VueGoodTablePlugin from 'vue-good-table';
import 'vue-good-table/dist/vue-good-table.css';
Vue.use(VueGoodTablePlugin);

window.axios = axios;


import moment from 'moment';

Vue.prototype.moment = moment;

import VeeValidate, { Validator } from 'vee-validate';
import en from 'vee-validate/dist/locale/en';
Validator.localize({ en: en });
Vue.use(VeeValidate, {locale: 'en'});

import Datepicker from 'vuejs-datepicker';
Vue.use(Datepicker);

Vue.config.devtools = true;

Vue.component('example', require('./components/example.vue').default);

Vue.component('transaction-index', require('./components/transactions/index.vue').default);
Vue.component('balance', require('./components/transactions/balance.vue').default);

const app = new Vue({
    el: '#app',
    mounted(){
    	console.log('Mounted!');
    },
});
