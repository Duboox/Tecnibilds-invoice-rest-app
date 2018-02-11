import Vue from 'vue';
import Vuex from 'vuex';

/* Persisted State */
import createPersistedState from 'vuex-persistedstate'

/* Modules */
import Users from './modules/users'
import Dashboard from './modules/dashboard'
import Products from './modules/products'
import Employees from './modules/employees'
import Chats from './modules/chats'

Vue.use(Vuex);

/* DEBUG MODE */
const debug = process.env.NODE_ENV !== 'production';

/* MODULES */
const ModuleUsers = Users;
const ModuleDashboard = Dashboard;
const ModuleProducts = Products;
const ModuleEmployees = Employees;
const ModuleChats = Chats;


export const store = new Vuex.Store({
  modules: {
    users: ModuleUsers,
    dashboard: ModuleDashboard,
    products: ModuleProducts,
    employees: ModuleEmployees,
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