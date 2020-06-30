import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/views/Home'

import login from './login'
import hometab from './hometab'
import accout from './accout'

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home,
      meta: {
        title: '首页'
      }
    },
    ...login,
    ...hometab,
    ...accout
  ]
})
