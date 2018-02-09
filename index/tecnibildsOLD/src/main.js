import "babel-polyfill"
import Vue from 'vue'
import App from './App'
import router from './router'

Vue.config.productionTip = false

// NProgress.js Bar
import NProgress from 'vue-nprogress'
const options = {
    latencyThreshold: 100,
    router: true,
    http: true
};
Vue.use(NProgress, options);
const nprogress = new NProgress('.nprogress-container');

// Global SASS Own Styles
import './styles/main.scss'

// Vuetify Material
import Vuetify from 'vuetify'
Vue.use(Vuetify);

/* eslint-disable no-new */
new Vue({
    el: '#app',
    router,
    template: '<App/>',
    components: {App}
})
