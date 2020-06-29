const state = {
  agentName:'',
  mobilePhone:'',
  code:'',
  oldPassword:'',
  password:'',
  sex:'',
  agentType:'',
  company:'',
  companyAddress:'',
  companyPhone:'',
  proofImg:'',
  auditState:'0',
  agentSite:'',
  province:'',
  provinceName:'',
  city:'',
  cityName:'',
  district:'',
  districtName:'',
  recommendOrg:''
}

const getters = {
  account: state => state
}

const actions = {
  clearAccount ({ commit, state }) {
    commit('CLEAR_ACCOUNT')
  }
}

const mutations = {
  ['CLEAR_ACCOUNT'] (state) {
    state.agentName=''
    state.mobilePhone=''
    state.code=''
    state.oldPassword=''
    state.password=''
    state.sex='0'
    state.birthday=''
    state.agentType=''
    state.company=''
    state.companyAddress=''
    state.companyPhone=''
    state.proofImg=''
    state.auditState='0'
    state.agentSite=''
    state.province = ''
    state.provinceName = ''
    state.city = ''
    state.cityName = ''
    state.district = ''
    state.districtName = ''
    state.recommendOrg = ''
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
