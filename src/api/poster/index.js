import axios from '@/api/transport'

export default {
  select(query){
    return new Promise((resolve,reject)=>{
      axios.get('basedata/agent/customer/poster',{params:query}).then(resolve).catch(reject)
    })
  },
  get(id){
    return new Promise((resolve,reject)=>{
      axios.get(`basedata/agent/customer/activity/${id}`).then(resolve).catch(reject)
    })
  }
}
