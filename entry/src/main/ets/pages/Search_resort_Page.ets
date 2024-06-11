//热门景区页面搜索结果
////暂未实现，仅可预览搜索字体

import router from '@ohos.router';

@Entry
@Component
struct Search_resort_Page {
  // @Prop
  // searchString: string

  // 用于接受由页面跳转传递的参数名称
  @State searchString: string = router.getParams()?.['searchString']

  build() {
    Row() {
      Column() {
        Text(this.searchString)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button("返回")
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}