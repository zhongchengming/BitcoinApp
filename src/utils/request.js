import axios from 'axios'
/*import { MessageBox, Message,Notification } from 'element-ui'*/
import { Toast} from 'vue-ydui/dist/lib.rem/dialog';
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
    //const res = response.data
    const code = response.status
    if(code===200){
      if (response.data && response.data.resultCode===1){
        if(response.data.resultMsg){
          Toast({ mes: response.data.resultMsg})
        }
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
    // if the custom code is not 20000, it is judged as an error.
    /* if (res.code !== 20000) {
         Message({
             message: res.message || 'Error',
             type: 'error',
             duration: 5 * 1000
         })

         // 50008: Illegal token; 50012: Other clients logged in; 50014: Token expired;
         if (res.code === 50008 || res.code === 50012 || res.code === 50014) {
             // to re-login
             MessageBox.confirm('You have been logged out, you can cancel to stay on this page, or log in again', 'Confirm logout', {
                 confirmButtonText: 'Re-Login',
                 cancelButtonText: 'Cancel',
                 type: 'warning'
             }).then(() => {
                 store.dispatch('user/resetToken').then(() => {
                     location.reload()
                 })
             })
         }
         return Promise.reject(new Error(res.message || 'Error'))
     } else {
         return res
     }*/
  },
  error => {
    console.log('err' + error) // for debug
    Toast({ mes: error.message})
    return Promise.reject(error)
  }
)

export default service
