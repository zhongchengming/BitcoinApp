import request from '@/utils/request'

/*提示展示*/
export function messagelist() {
  return request({
    url: '/user/messageList',
    method: 'post'
  })
}
/*公告*/
export function noticeArticle(data) {
  let baseUrl='/other/queryArticle?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
export function queryArticle(data) {
  let baseUrl='/other/queryArticle?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
export function saveOrUpdateCoin(data) {
  let baseUrl='/user/saveOrUpdateCoin?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
/*获取文章详情*/
export function queryArticleDeatil(data) {
  let baseUrl='/other/queryArticleDeatil?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])+'&'
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}

/*获取验证码*/
export function getSendCode(data) {
  let baseUrl='/user/sendCode?'
  for(var i in data){
    baseUrl +=i+'='+encodeURIComponent(data[i])
  }
  return request({
    url: baseUrl,
    method: 'post',
    data
  })
}
