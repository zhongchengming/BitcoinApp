/*我的*/
import Money from '@/views/my/Money'
import My from '@/views/my/Index'
import Integral from '@/views/my/Integral'
import Withdrawal from '@/views/my/Withdrawal'
import MoneyRecord from '@/views/my/MoneyRecord'
import MyPassword from '@/views/my/Password'


export default [
  {
    path: '/my/money',
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
    path: '/my/withdrawal',
    name: 'Withdrawal',
    component: Withdrawal,
    meta: {
      title: '提现'
    }
  },
  {
    path: '/my/integral',
    name: 'Integral',
    component: Integral,
    meta: {
      title: '积分兑换'
    }
  },
  {
    path: '/my/moneyRecord',
    name: 'MoneyRecord',
    component: MoneyRecord,
    meta: {
      title: '充值记录'
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
]
