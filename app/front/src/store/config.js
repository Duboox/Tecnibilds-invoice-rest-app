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

  /* PRODUCTS */
  getProductMethod: 'get',
  getProductRequest: '/api/product',

  saveEditProductMethod: 'put',
  saveEditProductRequest: '/api/product/',

  saveProductMethod: 'post',
  saveProductRequest: '/api/product',

  deleteProductMethod: 'delete',
  deleteProductRequest: '/api/product',

  /* Chat Messages */
  getMessagesMethod: 'get',
  getMessagesRequest: '/api/message',

  saveMessagesMethod: 'post',
  saveMessagesRequest: '/api/message',

  deleteMessagesMethod: 'delete',
  deleteMessagesRequest: '/api/message'
}