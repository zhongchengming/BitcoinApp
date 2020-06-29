import axios from '@/api/transport'
import {HEADER_FORM} from '../constants'

export default {
  getSource() {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/customer/source').then(resolve).catch(reject)
    })
  },
  createExpoCustomer(query) {
    return new Promise((resolve, reject) => {
      axios.post('basedata/agent/customer', query).then(resolve).catch(reject)
    })
  },
  createBaseCustomer(query) {
    return new Promise((resolve, reject) => {
      axios.post('basedata/agent/customer/base', query).then(resolve).catch(reject)
    })
  },
  getCustomers(query) {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/customer', {params: query}).then(resolve).catch(reject)
    })
  },
  clearHistory() {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/customer/search/history/clear').then(resolve).catch(reject)
    })
  },
  getBaseCustomer(query) {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/customer/base', {params: query}).then(resolve).catch(reject)
    })
  },
  getSearchHistory() {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/customer/search/history').then(resolve).catch(reject)
    })
  },
  saveSearchHistory(keyword) {
    return new Promise((resolve, reject) => {
      axios.post('basedata/agent/customer/search/history', {keyword: keyword}, {headers: HEADER_FORM}).then(resolve).catch(reject)
    })
  },
  searchList(query) {
    return new Promise((resolve, reject) => {
      axios.get('basedata/agent/customer/search/list',{params:query}).then(resolve).catch(reject)
    })
  }
}
