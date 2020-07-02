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
