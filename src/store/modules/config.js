import * as types from '../mutation-types'

const state = {
}

const getters = {
  config: state => state
}

const actions = {
  loadConfig ({ commit, state }, config) {
    commit(types.LOAD_CONFIG, config)
  }
}

const mutations = {
  [types.LOAD_CONFIG] (state, config) {
    state = Object.assign(state, config)
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
