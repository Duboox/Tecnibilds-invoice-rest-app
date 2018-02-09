// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import VueEcho from 'vue-echo';
import Pusher from 'pusher-js';

Vue.config.productionTip = false;

// Polyfills IE-11
import "babel-polyfill";

// Global SASS Own Styles
import './styles/main.scss'

// Vuetify Material
import Vuetify from 'vuetify'
Vue.use(Vuetify);

// API Config
import ApiConfig from './config'
Vue.use(ApiConfig);

// Axios
import axios from 'axios'
import VueAxios from 'vue-axios'
Vue.use(VueAxios, axios);

// Vuex Store
import { store } from './store/store'

// CHART.JS
import VueCharts from 'vue-chartjs'
Vue.use(VueCharts);

// Vue-Laravel Echo
Vue.use(VueEcho, {
  broadcaster: 'pusher',
  key: 'ee24236ae9099c5fe4ed',
  cluster: 'us2',
  authEndpoint: Vue.prototype.$configs.ApiUrl + 'broadcasting/auth',
  /* app/Http/Kernel.php. VerifyCSRFToken Removed */
  encrypted: true
});


// Vue-Progressbar
import VueProgressBar from 'vue-progressbar'
const barOptions = {
  color: 'rgb(143, 255, 199)',
  failedColor: 'red',
  thickness: '2px',
  transition: {
    speed: '0.1s',
    opacity: '0.6s',
    termination: 300,
  },
      autoRevert: true,
      location: 'top',
      inverse: false
};
Vue.use(VueProgressBar, barOptions);

/* Navigation guards */
router.beforeEach(
    (to, from, next) => {
      /* Si en la meta de los routes es para visitantes */
      if(to.matched.some(record => record.meta.forVisitors)) {
        /* si es para visitantes y esta logeado ir a /home */
        if(store.getters.isAuthenticated ) {
          next({ path: '/dashboard'})
        } else {
          next()
        }
      } else if(to.matched.some(record => record.meta.forAuth)) {
        /* si es para visitantes y esta logeado ir a /home */
        if( ! store.getters.isAuthenticated ) {
          next({ path: '/login'})
        } else {
          next()
        }
      } else {
        next()
      }
    }
)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: { App }
})
