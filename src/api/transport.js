import { Toast, Alert } from 'vue-ydui/dist/lib.rem/dialog';
import axios from 'axios'
import store from "../store"
import qs from 'qs'
import app from '../main'

/*console.log(process)
if (process.env) {
  console.log(process.env)
  /!*axios.defaults.baseURL = `${process.env.baseURL}api/`*!/
  axios.defaults.baseURL = process.env.baseURL
} else {
  axios.defaults.baseURL = '/api/'
}*/

axios.interceptors.request.use(request => {
  axios.defaults.baseURL = process.env.baseURL
  app.$Progress.start()
  let token = store.state.principal.token
  if(token) {
    request.headers.Authorization = `Bearer ${token}`
  }else {
    request.headers.Authorization = 'Bearer'
  }
  if (request.data && request.headers['Content-Type'] === 'application/x-www-form-urlencoded') {
    request.data = qs.stringify(request.data)
  }
  return request;
}, error => {
  app.$Progress.fail()
  return Promise.reject(error)
})

axios.interceptors.response.use(response => {
  console.log('response',response)
  app.$Progress.finish()
  let resp = response.data
  if (resp.code == 403 || resp.code == 413) {
    app.$router.push('/login')
    //Toast({ mes: resp.message || '登录信息已过期' })
    /*native.logout().then(() => {
      console.log('登出成功')
    }, () => {
      console.error('登出失败')
      router.push('/login')
    })*/
    return resp
  } else if(resp.code == 501 || resp.code ==502 || resp.code == 401){
    return resp
  }else if (resp.code != 200) {
    Toast({ mes: resp.message || '出错了' })
  }
  return resp
}, error => {
  app.$Progress.fail()
  console.error('error',error)
  return Promise.reject(error)
})

export default axios
