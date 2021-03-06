import axios from 'axios'
/*import { MessageBox, Message,Notification } from 'element-ui'*/
import { Toast,Confirm} from 'vue-ydui/dist/lib.rem/dialog';
import store from '@/store'
import { getToken } from '@/utils/auth'

// create an axios instance
const service = axios.create({
  baseURL: process.env.baseURL, // url = base url + request url
  // withCredentials: true, // send cookies when cross-domain requests
  timeout: 5000 // request timeout
})

// request interceptor
service.interceptors.request.use(
  config => {
    // do something before request is sent

    if (store.state.user.token){
      /*config.headers['token'] = store.state.user.token*/
      config.headers['token'] = getToken()
    }
    return config
  },
  error => {
    // do something with request error
    console.log(error) // for debug
    return Promise.reject(error)
  }
)

// response interceptor
service.interceptors.response.use(
  /**
   * If you want to get http information such as headers or status
   * Please return  response => response
   */

  /**
   * Determine the request status by custom code
   * Here is just an example
   * You can also judge the status by HTTP Status Code
   */
  response => {
    let codeState = response.data
    const code = response.status
    if(code===200){
      if (response.data && response.data.resultCode===1){
        if(response.data.resultMsg){
          Toast({ mes: response.data.resultMsg})
        }
        return response.data
      }else if(codeState.resultCode===2){
        /*token失效，重新登录*/
        let params={
          userid:'',
          token:''
        }

        Confirm({
          title: '登录超时，请重新登录！',
          opts: [
            {
              txt: '确定',
              color: true,
              callback: () => {
                //location.reload()
                console.log('111')
               /* this.$router.push({path:'/login'})*/
                store.dispatch('LogOut',params).then(()=>{
                  /* this.$router.push('/login')*/
                  location.reload()
                })
              }
            }
          ]
        })
        return response.data
      }else{
        //出现业务异常
        Toast({ mes: response.data.resultMsg || '出错了' })
        return response.data
      }

    }else {
      //应该走不到这一步
      Toast({ mes: response.data.resultMsg || '出错了' })
      return Promise.reject(response.data)
    }
  },
  error => {
    console.log('err' + error) // for debug
    console.log(error.response)
    Toast({ mes: error.message})
    return Promise.reject(error)
  }
)

export default service
