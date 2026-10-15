import request from '@/utils/request'

// 查询广告点位管理列表
export function listNode(query) {
  return request({
    url: '/manage/node/list',
    method: 'get',
    params: query
  })
}

// 查询广告点位管理详细
export function getNode(id) {
  return request({
    url: '/manage/node/' + id,
    method: 'get'
  })
}

// 新增广告点位管理
export function addNode(data) {
  return request({
    url: '/manage/node',
    method: 'post',
    data: data
  })
}

// 修改广告点位管理
export function updateNode(data) {
  return request({
    url: '/manage/node',
    method: 'put',
    data: data
  })
}

// 删除广告点位管理
export function delNode(id) {
  return request({
    url: '/manage/node/' + id,
    method: 'delete'
  })
}
