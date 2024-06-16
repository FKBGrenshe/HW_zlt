@Entry
@Component
struct MyPage {

  build() {
    Column() {
      // 用户信息部分
      Row() {
        // 头像
        Image($r("app.media.myicon6")) // 这里替换为你的头像资源路径
          .width('64vp')
          .height('64vp')
          .margin({ top: '16vp', left: '16vp' })

        // 用户名
        Text('游客')
          .fontWeight(FontWeight.Bold)
          .fontSize('24fp')
          .fontColor(Color.Black)
          .margin({ top: '28vp', left: '16vp' })
      }
      // .align(Align.Start) // 左对齐
      .margin({ bottom: '16vp' })

      // 分割线
      Divider()
        .color(Color.Gray)
        .width('100%')

      // 菜单项部分
      this.MyMenu($r("app.media.myicon1"), '个人信息')
      this.MyMenu($r("app.media.myicon2"), '我的预约')
      this.MyMenu($r("app.media.myicon3"), '我的收藏')
      this.MyMenu($r("app.media.myicon4"), '历史浏览')
      this.MyMenu($r("app.media.myicon5"), '设置')
    }
    .width('100%')
    .height('auto')
    .padding({ top: '16vp' })



  }
  @Builder
  MyMenu(icon, text) {
    Row() {
      // 图标
      Image(icon)
        .width('24vp')
        .height('24vp')
        .margin({ left: '16vp' })

      // 文本
      Text(text)
        .fontWeight(FontWeight.Medium)
        .fontSize('18fp')
        .fontColor(Color.Black)
        .margin({ left: '16vp' })

      // 右箭头
      Image($r("app.media.myicon7")) // 这里替换为你的右箭头图标资源路径
        .width('24vp')
        .height('24vp')
        .margin({ right: '0vp', left: '200vp' })
    }
    .width('100%')
    .height('48vp')
    // .align(Align.Center)
    .margin({ bottom: '8vp' })

    // 分割线
    Divider()
      .color(Color.Gray)
      .width('100%')
  }
}