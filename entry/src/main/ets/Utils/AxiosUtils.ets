import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'

export const httpObj = axios.create({
  baseURL: '192.168.0.133:8029',
  timeout: 2000
})

// 添加请求拦截器
httpObj.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 通过AppStorage获取token
  const token = AppStorage.Get('token')
  if (token) {
    // 若token存在，则将其添加到请求头
    config.headers['token'] = token
  }
  return config;
}, (error: AxiosError) => {
  //若出现异常，则提示异常信息
  return Promise.reject(error);
});