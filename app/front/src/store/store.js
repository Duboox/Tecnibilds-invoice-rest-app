import Vue from 'vue';
import Vuex from 'vuex';

/* Persisted State */
import createPersistedState from 'vuex-persistedstate'

/* Modules */
import Users from './modules/users'
import Products from './modules/products'
import Chats from './modules/chats'

Vue.use(Vuex);

/* DEBUG MODE */
const debug = process.env.NODE_ENV !== 'production';

/* MODULES */
const ModuleUsers = Users;
const ModuleProducts = Products;
const ModuleChats = Chats;


export const store = new Vuex.Store({
  modules: {
    users: ModuleUsers,
    products: ModuleProducts,
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