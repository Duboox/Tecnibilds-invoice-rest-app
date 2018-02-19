import axios from 'axios';
import config from '../config'

export default {
  state: {
    invoices: {
      model: []
    },
    selectedInvoice: {
      model: {
        date: '',
        due_date: '',
        title: '',
        discount: 0,
        customer_id: null,
        items: [],
        customer: {
          company: '',
          address: '',
        }
      }
    },
  },

  mutations: {
    SET_INVOICES(state, invoices){
      state.invoices = invoices
    },
    SET_INVOICE(state, invoice){
      state.selectedInvoice = invoice
    },
    REMOVE_SELECTED_INVOICE(state){
      state.selectedInvoice.model = {
        date: '',
        due_date: '',
        title: '',
        discount: 0,
        customer_id: null,
        items: [],
        customer: {
          company: '',
          address: '',
        }
      }
    },
    REMOVE_PRODUCT(state, product){
      let products = state.products.model;
      products.splice(products.indexOf(product), 1)
    },
  },

  actions: {
    setInvoices({commit, getters}) {
      return new Promise((resolve, reject) => {
        axios[config.getInvoiceMethod](config.apiUrl + config.getInvoiceRequest, {headers: getters.getHeader})
            .then(response => {
              let invoices = response.data;
              commit('SET_INVOICES', invoices);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    setInvoice({commit, getters}, invoiceID) {
      return new Promise((resolve, reject) => {
        axios[config.getInvoiceMethod](config.apiUrl + config.getInvoiceRequest + '/' + invoiceID, {headers: getters.getHeader})
            .then(response => {
              let invoice = response.data;
              commit('SET_INVOICE', invoice);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    saveEditProduct({getters}, product) {
      return new Promise((resolve, reject) => {
        axios[config.saveEditProductMethod](config.apiUrl + config.saveEditProductRequest + product.model.id, product.model, {headers: getters.getHeader})
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
    saveProduct({getters}, product) {
      return new Promise((resolve, reject) => {
        axios[config.saveProductMethod](config.apiUrl + config.saveProductRequest, product.model, {headers: getters.getHeader})
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
    removeSelectedInvoice(state) {
      state.commit('REMOVE_SELECTED_INVOICE')
    },
    removeProduct({getters, commit}, product) {
      return new Promise((resolve, reject) => {
        axios[config.deleteProductMethod](config.apiUrl + config.deleteProductRequest + '/' + product.id, {headers: getters.getHeader})
            .then(function (response) {
              if (response.data.deleted) {
                commit('REMOVE_PRODUCT', product);
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
    getInvoices(state) {
      return state.invoices
    },
    getInvoice(state) {
      return state.selectedInvoice
    },
  },
}
