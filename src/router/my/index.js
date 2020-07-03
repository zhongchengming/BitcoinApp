/*我的*/
import Money from '@/views/my/Money'
import My from '@/views/my/Index'
import IntegralExchange from '@/views/my/IntegralExchange'
import IntegralMoney from '@/views/my/IntegralMoney'
import Withdrawal from '@/views/my/Withdrawal'
import MoneyRecord from '@/views/my/MoneyRecord'
import IntegralExchangeRecord from '@/views/my/IntegralExchangeRecord'
import IntegralMoneyRecord from '@/views/my/IntegralMoneyRecord'
import WithdrawalRecord from '@/views/my/WithdrawalRecord'
import Share from '@/views/my/Share'
import Task from '@/views/my/Task'
import LoginPassword from '@/views/my/LoginPassword'
import WithdrawalPassword from '@/views/my/WithdrawalPassword'
import Integral from '@/views/my/Integral'
import BankMgt from '@/views/my/BankMgt'


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
      title: '账户'
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
    path: '/my/integralExchange',
    name: 'IntegralExchange',
    component: IntegralExchange,
    meta: {
      title: '积分兑换'
    }
  },
  {
    path: '/my/integralMoney',
    name: 'IntegralMoney',
    component: IntegralMoney,
    meta: {
      title: '积分充值'
    }
  },
  {
    path: '/my/integralExchangeRecord',
    name: 'IntegralExchangeRecord',
    component: IntegralExchangeRecord,
    meta: {
      title: '积分兑换记录'
    }
  },
  {
    path: '/my/integralMoneyRecord',
    name: 'IntegralMoneyRecord',
    component: IntegralMoneyRecord,
    meta: {
      title: '积分充值记录'
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
    path: '/my/withdrawalRecord',
    name: 'WithdrawalRecord',
    component: WithdrawalRecord,
    meta: {
      title: '提现记录'
    }
  },
  {
    path: '/my/share',
    name: 'Share',
    component: Share,
    meta: {
      title: '充值记录'
    }
  },
  {
    path: '/my/task',
    name: 'Task',
    component: Task,
    meta: {
      title: '我的任务'
    }
  },
  {
    path: '/my/loginPassword',
    name: 'LoginPassword',
    component: LoginPassword,
    meta: {
      title: '登录密码'
    }
  },
  {
    path: '/my/withdrawalPassword',
    name: 'WithdrawalPassword',
    component: WithdrawalPassword,
    meta: {
      title: '提现密码'
    }
  },
  {
    path: '/my/integral',
    name: 'Integral',
    component: Integral,
    meta: {
      title: '我的积分'
    }
  },
  {
    path: '/my/bankMgt',
    name: 'BankMgt',
    component: BankMgt,
    meta: {
      title: '银行管理'
    }
  }
]
