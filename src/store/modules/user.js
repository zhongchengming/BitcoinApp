import { login} from '@/api/login'
/*import { getToken, setToken, removeToken } from '@/utils/auth'
import { resetRouter } from '@/router'*/

const user={
  state:{
   /* token: getToken(),*/
    token:'',
    userId: '',
    avatar: ''
  },
  mutations :{
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_UNSER_ID: (state, userId) => {
      state.userId = userId
    }
  },
  actions :{
    async Login({commit,dispatch},loginForm){
      return new Promise((resolve,reject) =>{
        login(loginForm).then(response=>{
          commit('SET_TOKEN','token22211')
          commit('SET_UNSER_ID',response.resultBody.id)
          /*if(response.token){
            //setToken(response.token)
            commit('SET_TOKEN',response.token)
          }*/
          resolve(response)
        }).catch(error=>{
          reject(error)
        })
      })
    },
    //退出
    LogOut({commit,state}){
      return new Promise(resolve => {
        commit('SET_TOKEN','')
        commit('SET_UNSER_ID','')
        resolve()
      })
    }
  }
}
export default user

