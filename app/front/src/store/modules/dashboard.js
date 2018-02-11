import axios from 'axios';
import config from '../config'

export default {
  state: {
    dashboard: {
      analytics: []
    },
  },

  mutations: {
    SET_ANALYTICS(state, analytics){
      state.dashboard = analytics
    },
  },

  actions: {
    setAnalytics({commit, getters}) {
      return new Promise((resolve, reject) => {
        axios[config.getAnalyticsMethod](config.apiUrl + config.getAnalyticsRequest, {headers: getters.getHeader})
            .then(response => {
              let analytics = response.data;
              commit('SET_ANALYTICS', analytics);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
  },

  getters: {
    getAnalytics(state) {
      return state.dashboard.analytics
    },
  },
}