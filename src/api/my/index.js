import request from '@/utils/request'

/*充值记录查询*/
export function selectOrder(data) {
  /*return request({
    url: '/web/selectOrder',
    method: 'post',
    data
  })*/
  let baseUrl='/web/selectOrder?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
/*套餐接口*/
export function queryBankList() {
  return request({
    url: '/other/bankList',
    method: 'post'
  })
}
/*充值*/
export function updateOrderApp(data) {
  let baseUrl='/web/updateOrderApp?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
export function selectBank() {
  return request({
    url: '/other/selectBank',
    method: 'post'
  })
}

/*积分兑换说明*/
export function queryAppSetup() {
  return request({
    url: '/other/appSetup',
    method: 'post'
  })
}
/*积分兑换*/
export function integralDuiH(data) {
  let baseUrl='/other/integralDuiH?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
/*提现申请*/
export function withdrawalApply(data) {
  let baseUrl='/user/withdrawalApply?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
/*提现记录*/
export function withdrawalHistroy(data) {
  let baseUrl='/user/withdrawalHistroy?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
/*积分兑换或者充值记录*/
export function dhHistory(data) {
  let baseUrl='/other/dhHistory?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}

/*修改密码*/
export function changePwd(data) {
  let baseUrl='/user/changePwd?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}

/*我的积分*/

export function integralHistory(data) {
  let baseUrl='/other/integralHistory?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}

/*交易账户金额*/
export function queryCoin(data) {
  let baseUrl='/user/queryCoin?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
/*交易账户金额接口换成这个*/
export function getbtbCoin(data) {
  let baseUrl='/user/getbtbCoin?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
/*查询是否已经绑定*/
export function getIsBind(data) {
  let baseUrl='/user/getIsBind?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
/*脚本列表*/
export function queryTransaction() {
  return request({
    url: '/web/queryTransaction',
    method: 'post'
  })
}
/*开始或者停止执行*/
export function startOrStopTransaction(data) {
  let baseUrl='/web/startOrStopTransaction?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
