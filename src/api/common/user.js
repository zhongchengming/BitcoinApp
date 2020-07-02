import request from '@/utils/request'

/*提示展示*/
export function messagelist() {
  return request({
    url: '/user/messageList',
    method: 'post'
  })
}
