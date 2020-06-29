import Vue from 'vue'
import Vuex from 'vuex'
import principal from './modules/principal'
import config from './modules/config'
import account from './modules/account'
import createPersistedState from 'vuex-persistedstate'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    principal,
    config,
    account
  },
  plugins: [
    createPersistedState()
  ]
})
