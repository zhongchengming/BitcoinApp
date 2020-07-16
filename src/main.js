// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App'
import router from './router'

import YDUI from 'vue-ydui'
import Vant from 'vant'
import { CountDown } from 'vant';
Vue.use(CountDown);
import 'vant/lib/index.css'
import VueProgressBar from 'vue-progressbar'
import VueMoment from 'vue-moment'
import moment from 'moment'
import VueParticles from 'vue-particles'
Vue.use(VueParticles)

import { getToken } from '@/utils/auth'
router.beforeEach((to, from, next) => {
  /*console.log('before route', to.meta)*/
  const hasToken = getToken()
  if (to.meta.open) {
    if (to.meta.title) {
      document.title = to.meta.title
    }
    //无需登录验证的页面 直接放过
    next()
  } else {
    console.log(hasToken)
    if (hasToken) {
      if (to.meta.title) {
        document.title = to.meta.title
      }
      //token合法 放过
      next()
    } else {
      //记住要跳转的路径
      router.push({path:'/login',query:{lastPath:to.fullPath}})
    }
  }
})

Vue.use(VueRouter)

Vue.use(VueProgressBar, {
  color: '#6c31ff',
  failedColor: '#d50027',
  thickness: '2px',
  transition: {
    speed: '0.2s',
    opacity: '0.6s',
    termination: 300
  },
  autoRevert: true,
  location: 'top',
  inverse: false
})
Vue.use(VueMoment, moment)
Vue.use(YDUI)
Vue.use(Vant)
import store from './store'
let app = new Vue({
  store,
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})



Vue.config.productionTip = false

export default app
