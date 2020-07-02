import { login,outLogin} from '@/api/login'
import { getToken, setToken, removeToken } from '@/utils/auth'

const user={
  state:{
    token: getToken(),
   /* token:'',*/
    userId: '',
    username:'',
    invitationcode:''
  },
  mutations :{
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
    }
  },
  actions :{
    async Login({commit,dispatch},loginForm){
      return new Promise((resolve,reject) =>{
        login(loginForm).then(response=>{
          let data=response.resultBody
          if(data.token){
            setToken(data.token)
            commit('SET_TOKEN',data.token)
            commit('SET_UNSER_ID',data.user.id)
            commit('SET_UNSER_NAME',data.user.username)
            commit('SET_INVITATIONCODE',data.user.invitationcode)
          }
          resolve(response)
        }).catch(error=>{
          reject(error)
        })
      })
    },
    //退出
    async LogOut({commit,dispatch},dataParm){
      return new Promise((resolve,reject) =>{
        outLogin(dataParm).then(response=>{
          removeToken()
          commit('SET_TOKEN','')
          commit('SET_UNSER_ID','')
          commit('SET_UNSER_NAME','')
          commit('SET_INVITATIONCODE','')
          resolve(response)
        }).catch(error=>{
          reject(error)
        })
      })
    },
    /*LogOut({commit,state}){
      return new Promise(resolve => {
        commit('SET_TOKEN','')
        commit('SET_UNSER_ID','')
        resolve()
      })
    }*/
  }
}
export default user

