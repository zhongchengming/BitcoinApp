import axios from '@/api/transport'

export default {
  list(query) {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/integral',query).then(resolve).catch(reject)
    })
  },
  sum() {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/integral/sum').then(resolve).catch(reject)
    })
  },
  sumByExpo(query) {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/integral/sumbyexpo',{params:query}).then(resolve).catch(reject)
    })
  },
  withdrawal(input) {
    return new Promise((resolve, reject) => {
      axios.post('basedata/agent/integral',input).then(resolve).catch(reject)
    })
  },
  withdrawalList(query) {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/integral/withdraw/list',{params:query}).then(resolve).catch(reject)
    })
  }
}
