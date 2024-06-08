#### -- 旅游APP -- Group4

#### 如何使用devecostudio连接github
1. （推荐下载）github desktop
   非命令行操作，有GUI界面，比较简单方便
3. devecostudio--file--setting--plugin--marketplace可找到GitHub插件
   具体使用方法可参考： https://blog.csdn.net/ya6543/article/details/113280085

 #### 关于函数、页面命名

 ####页面命名
 1. 页面命名统一使用中译英命名，并在页面开头添加//注释标明：页面作用

    举例如：登录界面-- loging.ets
             //该文件为登录页面

2. model/Info.ets页面命名
每人使用自己的Info文件保存自己所使用的结构体
Info文件命名可添加后缀，
Info文件第一行添加//注释，表明文件作者，其他人不可对该文件修改

   举例如：热门景点消息结构体 -- GetInfo_resorts.ets
      // C的文件，其他人不可修改

####函数命名--API函数
1. Utils/Api中函数命名统一使用添加后缀，格式为“请求类型_请求用途”
2. Utils/Api中函数中第一行强制添加//注释，标明方法用途
   
   举例如: 使用get方法请求热门景点，则为:
   
   export function get_resorts(){
   //该方法请求热门景点
     return...
   }



####项目提交
项目仅在完全可跑通后进行提交，目的在于保证github仓库项目为完整可跑通代码，提交时需说明增删修改某些文件的必要说明

其余潜在可能出现问题，随时讨论，随时补充ing...
