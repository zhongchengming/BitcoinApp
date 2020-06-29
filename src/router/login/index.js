import Login from '@/views/login/Login'
import Registered from '@/views/login/Registered'

export default [
  {
    path: '/login',
    name: 'Login',
    component: Login,
    meta: {
      title: '登录',
      open: true
    }
  },
  {
    path: '/logout',
    name: 'logout',
    component: ()=> import('@/views/login/LogOut')
  },
  {
    path: '/registered',
    name: 'Registered',
    component: Registered,
    meta: {
      title: '注册',
      open: true
    }
  },
]

