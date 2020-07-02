import Vue from 'vue'
import Vuex from 'vuex'
import principal from './modules/principal'
import config from './modules/config'
import account from './modules/account'
import user from './modules/user'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    principal,
    config,
    account,
    user
  },
  plugins: [
    createPersistedState()
  ]
})
