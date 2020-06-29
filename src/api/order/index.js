import axios from '@/api/transport'
import {HEADER_FORM} from "../constants";

export default {
  list(query){
    return axios.get('basedata/agent/order',{params:query})
  },
  get(id){
    return axios.get(`basedata/agent/order/${id}`)
  },
  getSearchHistory() {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/customer/search/history').then(resolve).catch(reject)
    })
  },
  saveSearchHistory(keyword) {
    return new Promise((resolve, reject) => {
      axios.post('basedata/agent/customer/search/history',{keyword:keyword},{ headers: HEADER_FORM }).then(resolve).catch(reject)
    })
  },
  clearHistory(){
    return new Promise((resolve,reject)=>{
      axios.get('basedata/agent/customer/search/history/clear').then(resolve).catch(reject)
    })
  },
}
