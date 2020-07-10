import About from '@/views/hometab/About'
import Guide from '@/views/hometab/Guide'
import Service from '@/views/hometab/Service'
import Download from '@/views/hometab/Download'
import InfoDetail from '@/views/hometab/InfoDetail'

export default [
  {
    path: '/about',
    name: 'About',
    component: About,
    meta: {
      title: '智投鼠介绍'
    }
  },
  {
    path: '/guide',
    name: 'Guide',
    component:Guide,
    meta: {
      title: '新手指导'
    }
  },
  {
    path: '/download',
    name: 'Download',
    component:Download,
    meta: {
      title: 'APP下载'
    }
  },{
    path: '/service',
    name: 'Service',
    component:Service,
    meta: {
      title: '在线客服'
    }
  },{
    path: '/infoDetail',
    name: 'InfoDetail',
    component:InfoDetail,
    meta: {
      title: '资讯详情'
    }
  }
]
