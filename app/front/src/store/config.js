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

  getAllUsersMethod: 'get',
  getAllUsersRequest: '/api/users',

  getUserNotificationsMethod: 'get',
  getUserNotificationsRequest: '/api/notification',

  saveUserMethod: 'put',
  saveUserRequest: '/api/users/',

  /* DASHBOARD */
  getDashboardMethod: 'get',
  getDashboardRequest: '/api/dashboard',

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

  /* CUSTOMERS */
  getCustomerMethod: 'get',
  getCustomerRequest: '/api/customer',

  saveEditCustomerMethod: 'put',
  saveEditCustomerRequest: '/api/customer/',

  saveCustomerMethod: 'post',
  saveCustomerRequest: '/api/customer',

  deleteCustomerMethod: 'delete',
  deleteCustomerRequest: '/api/customer',

  /* PROVIDERS */
  getProviderMethod: 'get',
  getProviderRequest: '/api/provider',

  saveEditProviderMethod: 'put',
  saveEditProviderRequest: '/api/provider/',

  saveProviderMethod: 'post',
  saveProviderRequest: '/api/provider',

  deleteProviderMethod: 'delete',
  deleteProviderRequest: '/api/provider',

  /* Chat Messages */
  getMessagesMethod: 'get',
  getMessagesRequest: '/api/message',

  saveMessagesMethod: 'post',
  saveMessagesRequest: '/api/message',

  deleteMessagesMethod: 'delete',
  deleteMessagesRequest: '/api/message',

  /* POSTS COMMENTS */
  savePostCommentMethod: 'post',
  postCommentsRequest: '/api/postComment',
}