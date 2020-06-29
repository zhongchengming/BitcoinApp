import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/views/Home'
/*我的*/
import Money from '@/views/my/Money'
import My from '@/views/my/Index'
import MyPassword from '@/views/my/Password'
import MyPersonalInformation from '@/views/my/PersonalInformation'
import MyWork from '@/views/my/Work'

import login from './login'
import hometab from './hometab'

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
    {
      path: '/money',
      name: 'Money',
      component: Money,
      meta: {
        title: '充值'
      }
    },
    {
      path: '/my',
      name: 'My',
      component: My,
      meta: {
        title: '个人设置'
      }
    },
    {
      path: '/my/personal/information',
      name: 'MyPersonalInformation',
      component: MyPersonalInformation,
      meta: {
        title: '个人信息'
      }
    },
    {
      path: '/my/work',
      name: 'MyWork',
      component: MyWork,
      meta: {
        title: '工作信息'
      }
    },
    {
      path: '/my/password',
      name: 'MyPassword',
      component: MyPassword,
      meta: {
        title: '设置密码'
      }
    },
    ...login,
    ...hometab
  ]
})
