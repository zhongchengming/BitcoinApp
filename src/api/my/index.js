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
export function queryBankList() {
  return request({
    url: '/other/bankList',
    method: 'post'
  })
}

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
