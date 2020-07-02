import request from '@/utils/request'

export function login(data) {
  /*return request({
    url: '/user/login',
    method: 'post',
    data
  })*/
  let baseUrl='/user/login?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
export function register(data) {
  /*return request({
    url: '/user/register',
    method: 'post',
    data
  })*/
  let baseUrl='/user/register?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}

/*
import axios from '@/api/transport'
import md5 from 'md5'

export default {
  login(query) {
    return new Promise((resolve, reject) => {
      axios.post(`/Login/dologin`, query).then(resolve).catch(reject)
    })
  },
  /!*sendCode(mobile){
    return new Promise((resolve, reject) => {
      axios.get(`basedata/agent/register/${mobile}/code`).then(resolve).catch(reject)
    })
  },
  register(query) {
    query.password = md5(query.oldPassword)
    return new Promise((resolve, reject) => {
      axios.post('basedata/agent/register', query).then(resolve).catch(reject)
    })
  },
  loginCode(mobile) {
    return new Promise((resolve, reject) => {
      axios.get(`basedata/agent/login/${mobile}/code`).then(resolve).catch(reject)
    })
  },
  signin(query) {
    return new Promise((resolve, reject) => {
      axios.post(`basedata/agent/signin`, query).then(resolve).catch(reject)
    })
  },
  update(query) {
    return new Promise((resolve, reject) => {
      axios.post("basedata/agent/register/password", query).then(resolve).catch(reject)
    })
  },
  logout() {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/logout').then(resolve).catch(reject)
    })
  },
  preRegister(query) {
    return new Promise((resolve, reject) => {
      axios.post('basedata/agent/register/before',query).then(resolve).catch(reject)
    })
  }*!/
}
*/
