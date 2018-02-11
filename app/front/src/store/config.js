export default {
  /* API URL */
  apiUrl: 'http://127.0.0.1:8000',

  /* USERS */
  loginMethod: 'post',
  loginRequest: '/oauth/token',

  getUserMethod: 'get',
  getUserRequest: '/api/user',

  registerMethod: 'post',
  registerRequest: '/api/register',

  /* DASHBOARD ANALYTICS */
  getAnalyticsMethod: 'get',
  getAnalyticsRequest: '/api/dashboard',

  /* PRODUCTS */
  getProductMethod: 'get',
  getProductRequest: '/api/product',

  saveEditProductMethod: 'put',
  saveEditProductRequest: '/api/product/',

  saveProductMethod: 'post',
  saveProductRequest: '/api/product',

  deleteProductMethod: 'delete',
  deleteProductRequest: '/api/product',

  /* EMPLOYEES */
  getEmployeeMethod: 'get',
  getEmployeeRequest: '/api/employee',

  saveEditEmployeeMethod: 'put',
  saveEditEmployeeRequest: '/api/employee/',

  saveEmployeeMethod: 'post',
  saveEmployeeRequest: '/api/employee',

  deleteEmployeeMethod: 'delete',
  deleteEmployeeRequest: '/api/employee',

  /* Chat Messages */
  getMessagesMethod: 'get',
  getMessagesRequest: '/api/message',

  saveMessagesMethod: 'post',
  saveMessagesRequest: '/api/message',

  deleteMessagesMethod: 'delete',
  deleteMessagesRequest: '/api/message'
}