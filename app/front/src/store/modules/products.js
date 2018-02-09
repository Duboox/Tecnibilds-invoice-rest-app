import axios from 'axios';
import config from '../config'

export default {
  state: {
    products: {
      model: []
    },
    selectedProduct: {
      model: {}
    },
  },

  mutations: {
    SET_PRODUCTS(state, products){
      state.products = products
    },
    SET_PRODUCT(state, product){
      state.selectedProduct = product
    },
    REMOVE_SELECTED_PRODUCT(state){
      state.selectedProduct.model = {}
    },
    REMOVE_PRODUCT(state, product){
      let products = state.products.model;
      products.splice(products.indexOf(product), 1)
    },
  },

  actions: {
    setProducts({commit, getters}) {
      return new Promise((resolve, reject) => {
        axios[config.getProductMethod](config.apiUrl + config.getProductRequest, {headers: getters.getHeader})
            .then(response => {
              let products = response.data;
              commit('SET_PRODUCTS', products);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    setProduct({commit, getters}, productID) {
      return new Promise((resolve, reject) => {
        axios[config.getProductMethod](config.apiUrl + config.getProductRequest + '/' + productID, {headers: getters.getHeader})
            .then(response => {
              let product = response.data;
              commit('SET_PRODUCT', product);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    saveProduct(data) {
      return new Promise((resolve, reject) => {
        axios[config.saveProductMethod](config.apiUrl + config.saveProductRequest, data)
            .then(function (response) {
              if (response.data.saved) {
                state.commit('SAVE_PRODUCT', data);
              }
            })
            .catch(error => {
              reject(error);
            })
      })
    },
    removeSelectedProduct(state) {
      state.commit('REMOVE_SELECTED_PRODUCT')
    },
    removeProduct(state, product) {
      return new Promise((resolve, reject) => {
        axios[config.deleteProductMethod](config.apiUrl + config.getProductRequest + '/' + product.id)
            .then(function (response) {
              if (response.data.deleted) {
                state.commit('REMOVE_PRODUCT', product);
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
    getProducts(state) {
      return state.products
    },
    getProduct(state) {
      return state.selectedProduct
    },
  },
}