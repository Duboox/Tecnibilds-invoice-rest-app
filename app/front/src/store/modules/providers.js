import axios from 'axios';
import config from '../config'

export default {
  state: {
    providers: {
      model: []
    },
    selectedProvider: {
      model: {}
    },
  },

  mutations: {
    SET_PROVIDERS(state, providers){
      state.providers = providers
    },
    SET_PROVIDER(state, provider){
      state.selectedProvider = provider
    },
    REMOVE_SELECTED_PROVIDER(state){
      state.selectedProvider.model = {}
    },
    REMOVE_PROVIDER(state, provider){
      let providers = state.providers.model;
      providers.splice(providers.indexOf(provider), 1)
    },
  },

  actions: {
    setProviders({commit, getters}) {
      return new Promise((resolve, reject) => {
        axios[config.getProviderMethod](config.apiUrl + config.getProviderRequest, {headers: getters.getHeader})
            .then(response => {
              let providers = response.data;
              commit('SET_PROVIDERS', providers);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    setProvider({commit, getters}, providerID) {
      return new Promise((resolve, reject) => {
        axios[config.getProviderMethod](config.apiUrl + config.getProviderRequest + '/' + providerID, {headers: getters.getHeader})
            .then(response => {
              let provider = response.data;
              commit('SET_PROVIDER', provider);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    saveEditProvider({getters}, provider) {
      return new Promise((resolve, reject) => {
        axios[config.saveEditProviderMethod](config.apiUrl + config.saveEditProviderRequest + provider.model.id, provider.model, {headers: getters.getHeader})
            .then(function (response) {
              if (response.data.saved) {
                resolve(response)
              }
            })
            .catch(error => {
              reject(error);
            })
      })
    },
    saveProvider({getters}, provider) {
      return new Promise((resolve, reject) => {
        axios[config.saveProviderMethod](config.apiUrl + config.saveProviderRequest, provider.model, {headers: getters.getHeader})
            .then(function (response) {
              if (response.data.saved) {
                resolve(response)
              }
            })
            .catch(error => {
              reject(error);
            })
      })
    },
    removeSelectedProvider(state) {
      state.commit('REMOVE_SELECTED_PROVIDER')
    },
    removeProvider({getters, commit}, provider) {
      return new Promise((resolve, reject) => {
        axios[config.deleteProviderMethod](config.apiUrl + config.deleteProviderRequest + '/' + provider.id, {headers: getters.getHeader})
            .then(function (response) {
              if (response.data.deleted) { // Bool
                commit('REMOVE_PROVIDER', provider);
                resolve(response);
              }
              console.log(response)
            })
            .catch(error => {
              reject(error);
            })
      });
    },
  },

  getters: {
    getProviders(state) {
      return state.providers
    },
    getProvider(state) {
      return state.selectedProvider
    },
  },
}
