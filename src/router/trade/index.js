/*交易模块*/
import Trade from '@/views/trade/Index'
import TradeNext from '@/views/trade/TradeNext'


export default [
  {
    path: '/trade',
    name: 'Trade',
    component: Trade,
    meta: {
      title: '交易'
    }
  },
  {
    path: '/trade/next',
    name: 'TradeNext',
    component: TradeNext,
    meta: {
      title: '交易下一步'
    }
  },
]
