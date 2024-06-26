//index 程序的主入口

import { HomePage } from '../pages/home'
import { MallPage } from '../pages/MallPage'
import { MyPage } from './MyPage'

@Entry
@Component
struct Index {

  //滚动
  scroller: Scroller = new Scroller()

  @State message: string = 'Hello World'
  @StorageProp("token")
  token:string = ""

  @State currentTabIndex:number=0; //记录当前选项卡的index
  // 点击tab切换的时候，index改变，
  //父组件同步到circle中

  build() {

    Tabs() {
      TabContent() {
        // Text('打卡')
        HomePage()
      }
      // .tabBar('打卡')
      .tabBar(this.barBuilder(0,'主页'))

      TabContent() {
        // Text('朋友圈')
        // CirclePage()
        MallPage()
      }
      // .tabBar('朋友圈')
      .tabBar(this.barBuilder(1,'商城'))

      TabContent() {
        MyPage()
      }
      .tabBar(this.barBuilder(2,'我的'))

    }
    .barPosition(BarPosition.End)
    .onChange(index=>{
      this.currentTabIndex=index;
    })
  }


  // 自定义tabbar
  @Builder barBuilder(index: number, title: string) {
    Column() {
      Text(title)
        .tabTitleStyle(this.currentTabIndex===index?Color.Black:"#9595")
    }
  }

}

@Extend(Text) function tabTitleStyle(color: ResourceColor) {
  .fontSize(10)
  .fontWeight(FontWeight.Medium)
  .fontColor(color) //Color.Black
  .margin({ bottom: 2 })
}