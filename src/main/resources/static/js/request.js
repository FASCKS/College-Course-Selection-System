import axios from 'axios.js' //引入 axios

//create an axios instance   创建axios实例
const service = axios.create({
  baseURL: process.env.BASE_API, // api 的 base_url
  timeout: 600000, // request timeout  设置请求超时时间
  responseType: "json",
  withCredentials: true, // 是否允许带cookie这些
  headers: {
    "Content-Type": "application/json;charset=utf-8"
  }
})


var loadingInstance;
//request请求拦截器 添加 token
service.interceptors.request.use(
    config => {
        config.headers.token = localStorage.getItem('token');
        loadingInstance = Loading.service({ fullscreen: true , background: 'rgba(0, 0, 0, 0)'});//开启loading
        return config;
    },
    error => {
        Message({                  //使用element-ui的message进行信息提示
          showClose: true,
          message: error,
          type: "warning"
        });

        return Promise.reject(error)
    }
)

// response interceptor
service.interceptors.response.use(
    response => {
        // 如果返回的状态码为200，说明接口请求成功，可以正常拿到数据
        // 否则的话抛出错误
        if (response.status === 200) {
            loadingInstance.close();//关闭loading
            switch (response.data.code) {           
                // 其他错误，直接抛出错误提示
                case 0:
                    break;
                // 401: 未登录
                // 未登录则跳转登录页面，并携带当前页面的路径
                // 在登录成功后返回当前页面，这一步需要在登录页操作。
                case 203:
                    break;
                case 401:
                    Message({
                      showClose: true,
                      message:'登录过期，请重新登录',
                      type: 'error'
                    });
                    // 跳转登录页面，并将要浏览的页面fullPath传过去，登录成功后跳转需要访问的页面
                    setTimeout(() => {
                         // 清除token
                        localStorage.removeItem('token');
                    },1000);
                    break;
                // 403 token过期
                // 登录过期对用户进行提示
                // 清除本地token和清空vuex中token对象
                // 跳转登录页面
                case 403:
                      Message({
                        message: '登录过期，请重新登录',
                        duration: 1000,
                        forbidClick: true
                    });
                    // 清除token
                    localStorage.removeItem('token');
                    setTimeout(() => {
                         // 清除token
                        localStorage.removeItem('token');
                    },1000);
                    break;

                // 404请求不存在
                case 404:
                    Message({
                        message: '网络请求不存在',
                        duration: 1500,
                        forbidClick: true
                    });
                    break;
                // 其他错误，直接抛出错误提示
                default:
                    if(!response.data.size){//判断是否是文件
                        Message({
                          showClose: true,
                          message: response.data.msg?response.data.msg:'请求失败，请联系管理员',
                          type: 'error'
                        }); 
                    }                 
            }
            return Promise.resolve(response);
        } else {
            return Promise.reject(response);
        }
    },
    // 服务器状态码不是2开头的的情况
    // 这里可以跟你们的后台开发人员协商好统一的错误状态码
    // 然后根据返回的状态码进行一些操作，例如登录过期提示，错误提示等等
    // 下面列举几个常见的操作，其他需求可自行扩展
    error => {

        if(error.response){
            loadingInstance.close();//关闭loading
            if (error.response.status) {
                switch (error.response.status) {
                    // 401: 未登录
                    // 未登录则跳转登录页面，并携带当前页面的路径
                    // 在登录成功后返回当前页面，这一步需要在登录页操作。
                    case 401:
                        router.replace({//替换路由至登录页
                            path: '/',
                            query: {//传参
                                redirect: router.currentRoute.fullPath
                            }
                        });
                        break;

                    // 403 token过期
                    // 登录过期对用户进行提示
                    // 清除本地token和清空vuex中token对象
                    // 跳转登录页面
                    case 403:
                          Message({
                            message: '登录过期，请重新登录',
                            duration: 1000,
                            forbidClick: true
                        });
                        // 清除token
                        localStorage.removeItem('token');
                        // store.commit('loginSuccess', null);
                        // 跳转登录页面，并将要浏览的页面fullPath传过去，登录成功后跳转需要访问的页面
                        setTimeout(() => {
                            router.replace({
                                path: '/',
                                query: {
                                    redirect: router.currentRoute.fullPath
                                }
                            });
                        }, 1000);
                        break;

                    // 404请求不存在
                    case 404:
                        Message({
                            message: '网络请求不存在',
                            duration: 1500,
                            forbidClick: true
                        });
                        break;
                    // 其他错误，直接抛出错误提示
                    default:
                        Message({
                            message: error.response.data.message,
                            duration: 1500,
                            forbidClick: true
                        });
                }
                return Promise.reject(error.response);
            }
        }else{
            loadingInstance.close();//关闭loading
            Message({
                showClose: true,
                message: '请求失败，请联系管理员',
                type: 'error'
            });  
        }

});
export default service;