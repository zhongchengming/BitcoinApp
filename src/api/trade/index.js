import request from '@/utils/request'

/*交易模块*/
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
/*获取交易所列表*/
export function queryAlljys() {
  return request({
    url: '/web/queryAlljys',
    method: 'post'
  })
}
