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
