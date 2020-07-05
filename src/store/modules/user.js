import {login, outLogin} from '@/api/login'
import {getToken, setToken, removeToken} from '@/utils/auth'

const user = {
  state: {
    token: getToken(),
    /* token:'',*/
    userId: '',
    username: '',
    invitationcode: '',
    integral: '',
    btbname: '',
    btbmoney: '',
    afendtime: '',
    balance: '',//余额
    btbMoneyList: [],//日志记录
    endDay: ''//过期时间
  },
  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_UNSER_ID: (state, userId) => {
      state.userId = userId
    },
    SET_UNSER_NAME: (state, username) => {
      state.username = username
    },
    SET_INVITATIONCODE: (state, invitationcode) => {
      state.invitationcode = invitationcode
    },
    SET_INTEGRAL: (state, integral) => {
      state.integral = integral
    },
    SET_BTBNAME: (state, btbname) => {
      state.btbname = btbname
    },
    SET_BTMONEY: (state, btbmoney) => {
      state.btbmoney = btbmoney
    },
    SET_AFENDTIME: (state, afendtime) => {
      state.afendtime = afendtime
    },
    SET_BALANCE: (state, balance) => {
      state.balance = balance
    },
    SET_END_DAY: (state, endDay) => {
      state.endDay = endDay
    },
    SET_BTB_MONEY_LIST: (state, btbMoneyList) => {
      state.btbMoneyList = btbMoneyList
    }
  },
  actions: {
    async Login({commit, dispatch}, loginForm) {
      return new Promise((resolve, reject) => {
        login(loginForm).then(response => {
          let data = response.resultBody
          if (data.token) {
            setToken(data.token)
            commit('SET_TOKEN', data.token)
            commit('SET_UNSER_ID', data.user.id)
            commit('SET_UNSER_NAME', data.user.username)
            commit('SET_INVITATIONCODE', data.user.invitationcode)
            commit('SET_INTEGRAL', data.user.integral)
            commit('SET_BTBNAME', data.user.btbname)
            commit('SET_BTMONEY', data.user.btbmoney)
            commit('SET_AFENDTIME', data.user.afendtime)
            commit('SET_BALANCE', data.user.balance)
            commit('SET_END_DAY', data.endDay)
            commit('SET_BTB_MONEY_LIST', data.btbMoneyList)
          }
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    },
    //退出
    async LogOut({commit, dispatch}, dataParm) {
      return new Promise((resolve, reject) => {
        outLogin(dataParm).then(response => {
          removeToken()
          commit('SET_TOKEN', '')
           commit('SET_UNSER_ID','')
          commit('SET_UNSER_NAME','')
          commit('SET_INVITATIONCODE','')
          commit('SET_INTEGRAL','')
          commit('SET_BTBNAME','')
          commit('SET_BTMONEY','')
          commit('SET_AFENDTIME','')
          commit('SET_END_DAY', '')
          commit('SET_BTB_MONEY_LIST', [])
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    }
  }
}
export default user

