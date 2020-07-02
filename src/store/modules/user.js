import { login,outLogin} from '@/api/login'

const user={
  state:{
   /* token: getToken(),*/
    token:'',
    userId: '',
    username:''
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
    }
  },
  actions :{
    async Login({commit,dispatch},loginForm){
      return new Promise((resolve,reject) =>{
        login(loginForm).then(response=>{
          let data=response.resultBody
          if(data.token){
            commit('SET_TOKEN',data.token)
            commit('SET_UNSER_ID',data.user.id)
            commit('SET_UNSER_NAME',data.user.username)
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
          commit('SET_TOKEN','')
          commit('SET_UNSER_ID','')
          commit('SET_UNSER_NAME','')
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

