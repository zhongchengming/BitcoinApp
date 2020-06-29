import * as types from '../mutation-types'

const state = {
  token: '',
  expireAt: 0,
  name: '',
  avatar: '',
  member: false,
  type:'',
  permissions: [],
  isValid () {
    return this.token && ((this.expireAt - new Date().getTime()) > 0)
  },
  hasPermission (permission) {
    return this.permissions.includes(permission)
  },
  testing: false
}

const getters = {
  principal: state => state
}

const actions = {
  redirect ({ commit, state }, path) {
    commit(types.REDIRECT, path)
  },
  addToken ({ commit, state }, token) {
    commit(types.ADD_TOKEN, token)
  },
  addPrincipal ({ commit, state }, principal) {
    commit(types.ADD_PRINCIPAL, principal)
  },
  updateAvatar ({ commit, state }, avatar) {
    commit(types.UPDATE_AVATAR, avatar)
  },
  updateGender ({ commit, state }, gender) {
    commit(types.UPDATE_GENDER, gender)
  },
  updateMobile ({ commit, state }, mobile) {
    commit(types.UPDATE_MOBILE, mobile)
  },
  logout ({ commit, state }) {
    commit(types.LOGOUT)
  },
  testing  ({ commit, state }, testing){
    commit(types.TESTING,testing)
  }
}

const mutations = {
  [types.ADD_TOKEN] (state, token) {
    state.token = token.token
    state.expireAt = token.expire
  },
  [types.ADD_PRINCIPAL] (state, principal) {
    Object.assign(state, principal)
  },
  [types.UPDATE_AVATAR] (state, avatar) {
    state.avatar = avatar
  },
  [types.UPDATE_GENDER] (state, gender) {
    state.gender = gender
  },
  [types.UPDATE_MOBILE] (state, mobile) {
    state.mobile = mobile
  },
  [types.REDIRECT] (state, path) {
    state.path = path
  },
  [types.LOGOUT] (state) {
    state.token = ''
    state.expireAt = 0
    state.name = ''
    state.mobile = ''
    state.permissions= []
    state.type = ''
  },
  [types.TESTING](state, testing){
    state.testing = testing
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
