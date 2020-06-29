import axios from '@/api/transport'

export default {
  get() {
    return new Promise((resolve, reject) => {
      axios.get(`basedata/agent`).then(resolve).catch(reject)
    })
  },
  modify(query) {
    return new Promise((resolve, reject) => {
      axios.post('basedata/agent/modify', query).then(resolve).catch(reject)
    })
  },
  countCustomer(){
    return new Promise((resolve,reject)=>{
      axios.get('basedata/agent/customer/count').then(resolve).catch(reject)
    })
  }
}
