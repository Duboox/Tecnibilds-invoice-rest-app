import axios from 'axios';
import config from '../config'

export default {
  state: {
    employees: {
      model: []
    },
    selectedEmployee: {
      model: {}
    },
  },

  mutations: {
    SET_EMPLOYEES(state, employees){
      state.employees = employees
    },
    SET_EMPLOYEE(state, employee){
      state.selectedEmployee = employee
    },
    REMOVE_SELECTED_EMPLOYEE(state){
      state.selectedEmployee.model = {}
    },
    REMOVE_EMPLOYEE(state, employee){
      let employees = state.employees.model;
      employees.splice(employees.indexOf(employee), 1)
    },
  },

  actions: {
    setEmployees({commit, getters}) {
      return new Promise((resolve, reject) => {
        axios[config.getEmployeeMethod](config.apiUrl + config.getEmployeeRequest, {headers: getters.getHeader})
            .then(response => {
              let employees = response.data;
              commit('SET_EMPLOYEES', employees);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    setEmployee({commit, getters}, employeeID) {
      return new Promise((resolve, reject) => {
        axios[config.getEmployeeMethod](config.apiUrl + config.getEmployeeRequest + '/' + employeeID, {headers: getters.getHeader})
            .then(response => {
              let employee = response.data;
              commit('SET_EMPLOYEE', employee);
              resolve(response)
            })
            .catch(error => {
              reject(error)
            })
      })
    },
    saveEditEmployee({getters}, employee) {
      return new Promise((resolve, reject) => {
        axios[config.saveEditEmployeeMethod](config.apiUrl + config.saveEditEmployeeRequest + employee.model.id, employee.model, {headers: getters.getHeader})
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
    saveEmployee({getters}, employee) {
      return new Promise((resolve, reject) => {
        axios[config.saveEmployeeMethod](config.apiUrl + config.saveEmployeeRequest, employee.model, {headers: getters.getHeader})
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
    removeSelectedEmployee(state) {
      state.commit('REMOVE_SELECTED_EMPLOYEE')
    },
    removeEmployee({getters, commit}, employee) {
      return new Promise((resolve, reject) => {
        axios[config.deleteEmployeeMethod](config.apiUrl + config.deleteEmployeeRequest + '/' + employee.id, {headers: getters.getHeader})
            .then(function (response) {
              if (response.data.deleted) { // Bool
                commit('REMOVE_EMPLOYEE', employee);
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
    getEmployees(state) {
      return state.employees
    },
    getEmployee(state) {
      return state.selectedEmployee
    },
  },
}
