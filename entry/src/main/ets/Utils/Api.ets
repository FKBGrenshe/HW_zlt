import { httpObj } from './AxiosUtils'


//封装方法：请求响应方法
function getMine(){
  return httpObj.get('/word/user/info',{});
}

export function createPost(post:{
  rightCount:number,
  answeredCount:number,
  timeUsed:number
}){
  return httpObj.post('/word/post/create',post);
}


// 示例 -- 热门景点
// export function get_resorts() {
//   // 获取所有热门景区
//   return httpObj.get('/article/all', { params: {} })
// }

export function get_resort(){
  // 获取所有市区 -- 原方法名:getAll_resort
  return httpObj.get('/article/all', { params:{} })
}

export function get_resorts(){
  // 获取所有景区 -- 原方法名:getAll_resorts
  return httpObj.get('/article', { params:{type:7} })
}

export function getAllFood(){
  // 获取所有美食
  return httpObj.get('/foodType')
}

export function get_selectOneMall(id:string){
  return httpObj.get('/foodType/'+id, { params: { id: id } })
}

