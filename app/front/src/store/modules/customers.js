import axios from 'axios';
import config from '../config'

export default {
  state: {
    customers: {
      model: []
    },
    selectedCustomer: {
      model: {}
    },
  },

  mutations: {
    SET_CUSTOMERS(state, customers){
      state.customers = customers
    },
    SET_CUSTOMER(state, customer){
      state.selectedCustomer = customer
    },
    REMOVE_SELECTED_CUSTOMER(state){
      state.selectedCustomer.model = {}
    },
    REMOVE_CUSTOMER(state, customer){
      let customers = state.customers.model;
      customers.splice(customers.indexOf(customer), 1)
    },
  },

  actions: {
    setCustomers({commit, getters}) {
      return new Promise((resolve, reject) => {
        axios[config.getCustomerMethod](config.apiUrl + config.getCustomerRequest, {headers: getters.getHeader})
            .then(response => {
              let customers = response.data;
              commit('SET_CUSTOMERS', customers);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    setCustomer({commit, getters}, customerID) {
      return new Promise((resolve, reject) => {
        axios[config.getCustomerMethod](config.apiUrl + config.getCustomerRequest + '/' + customerID, {headers: getters.getHeader})
            .then(response => {
              let customer = response.data;
              commit('SET_CUSTOMER', customer);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    saveEditCustomer({getters}, customer) {
      return new Promise((resolve, reject) => {
        axios[config.saveEditCustomerMethod](config.apiUrl + config.saveEditCustomerRequest + customer.model.id, customer.model, {headers: getters.getHeader})
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
    saveCustomer({getters}, customer) {
      return new Promise((resolve, reject) => {
        axios[config.saveCustomerMethod](config.apiUrl + config.saveCustomerRequest, customer.model, {headers: getters.getHeader})
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
    removeSelectedCustomer(state) {
      state.commit('REMOVE_SELECTED_CUSTOMER')
    },
    removeCustomer({getters, commit}, customer) {
      return new Promise((resolve, reject) => {
        axios[config.deleteCustomerMethod](config.apiUrl + config.deleteCustomerRequest + '/' + customer.id, {headers: getters.getHeader})
            .then(function (response) {
              if (response.data.deleted) { // Bool
                commit('REMOVE_CUSTOMER', customer);
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
    getCustomers(state) {
      return state.customers
    },
    getCustomer(state) {
      return state.selectedCustomer
    },
  },
}
