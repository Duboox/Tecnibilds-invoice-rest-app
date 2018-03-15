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
        iva_percent: 0,
        customer_id: null,
        items: [],
        customer: {
          company: '',
          address: '',
        }
      }
    },
    REMOVE_INVOICE(state, invoice){
      let invoices = state.invoices.model;
      invoices.splice(invoices.indexOf(invoice), 1)
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
    saveEditInvoice({getters}, invoice) {
      return new Promise((resolve, reject) => {
        axios[config.saveEditInvoiceMethod](config.apiUrl + config.saveEditInvoiceRequest + invoice.id, invoice, {headers: getters.getHeader})
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
    saveInvoice({getters}, invoice) {
      return new Promise((resolve, reject) => {
        axios[config.saveInvoiceMethod](config.apiUrl + config.saveInvoiceRequest, invoice, {headers: getters.getHeader})
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
    removeInvoice({getters, commit}, invoice) {
      return new Promise((resolve, reject) => {
        axios[config.deleteInvoiceMethod](config.apiUrl + config.deleteInvoiceRequest + '/' + invoice.id, {headers: getters.getHeader})
            .then(function (response) {
              if (response.data.deleted) {
                commit('REMOVE_INVOICE', invoice);
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
