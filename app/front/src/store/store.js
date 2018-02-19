import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);

/* DEBUG MODE */
const debug = process.env.NODE_ENV !== 'production';

/* Persisted State */
import createPersistedState from 'vuex-persistedstate'

/* Modules */
import Users from './modules/users'
import Dashboard from './modules/dashboard'
import Products from './modules/products'
import Employees from './modules/employees'
import Customers from './modules/customers'
import Providers from './modules/providers'
import Invoices from './modules/invoices'
import Chats from './modules/chats'

/* MODULES */
const ModuleUsers = Users;
const ModuleDashboard = Dashboard;
const ModuleProducts = Products;
const ModuleEmployees = Employees;
const ModuleCustomers = Customers;
const ModuleProviders = Providers;
const ModuleChats = Chats;
const ModuleInvoices = Invoices;

export const store = new Vuex.Store({
  modules: {
    users: ModuleUsers,
    dashboard: ModuleDashboard,
    products: ModuleProducts,
    employees: ModuleEmployees,
    customers: ModuleCustomers,
    providers: ModuleProviders,
    invoices: ModuleInvoices,
    chats: ModuleChats,
  },
  plugins: [
    createPersistedState({
      key: 'Tecnibilds',
      paths: [
        'users.tokens',
      ],
    })
  ],
  strict: false, /* use debug without persisted */
});