//热门景点页面

import { GetResortsInfo,GetResortInfo } from '../model/ItemData_resortspage'
import router from '@ohos.router'
import { get_resort,get_resorts } from '../Utils/Api'

@Preview
// @Entry
@Component //comp
export struct ResortPage {
  @State searchText: string = ''
  //##### 弹窗
  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: this.onCancel,
      confirm: this.onAccept,
    }),
    alignment: DialogAlignment.Default,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  onCancel() {
    console.info('Callback when the first button is clicked')
  }
  onAccept() {
    console.info('Callback when the second button is clicked')
  }
  //#####

  @State getResortInfoList: GetResortInfo[] = [new GetResortInfo({
    id: 1,
    title: "龙门渡",
    des: '',
    point: null,
    createUser: '',
    createDate: ''
    }),
    new GetResortInfo({
      id: 2,
      title: "龙门",
      des: '',
      point: null,
      createUser: '',
      createDate: ''
    })
    ]
  @State getResortsInfoList: GetResortsInfo[] = null
  @StorageProp('token') token: string = ''
  @Prop @Watch("onRefresh")
  currentTabIndex: number// 获取父组件中的index

  //要给postInfoList赋值，通过请求响应
  onRefresh(){
    //tabbar切换的时候，index会变化，一变化，朋友圈页面的变量index就能接收到，接收到变化调用onRefresh方法
    if(this.currentTabIndex===1){
      //景点
      get_resorts().then(res=>{
        console.log(JSON.stringify(res.data.data.records))
        this.getResortsInfoList = res.data.data.records.map(item => {
          return new GetResortInfo(item)
        })
      })
      //市区
      get_resort().then(res=>{
        console.log(JSON.stringify(res.data.data))

        this.getResortInfoList = res.data.data.map(item => {
          return new GetResortInfo(item)
        })
      })
    }
  }


  //顶部横切标签 -- 市区分类
  @State currentIndex_district: number = 0;
  private tabsController: TabsController = new TabsController();
  @Builder
  TabBuilder(title: string, targetIndex: number) {
    Column() {
      Text(title)
        .fontColor(this.currentIndex_district === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex_district = targetIndex;
      this.tabsController.changeIndex(this.currentIndex_district);
    })
  }

  //swiper
  private swiperController: SwiperController = new SwiperController()


  build() {
    // Scroll(this.scroller) {
      Column() {

        //swipper
        Swiper(this.swiperController) {
          Image($r("app.media.resort2"))
            .width('100%')
            .height(100)
          // Image("app.media.resort3")
          //   .width('100%')
          // Image("app.media.resort4")
        }
        .loop(true)
        //搜索框
        Column() {
          Text('热门景区')
            .fontSize(18)
            .margin({ top: 25 })
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Orange)

          Row() {
            //textinput赋值给searchText
            TextInput({ placeholder: "请输入您要去的景点" })
              .textAlign(TextAlign.Start)
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .width('80%')
              .height(50)
              .backgroundColor(Color.White)
              .borderRadius(10)
              .padding({ left: 10 })
              .onChange((value: string) => {
                this.searchText = value
              })

            Button("搜索")
              .onClick(() => {
                // console.info(this.random.toString())
                if (this.searchText == '') {
                  //todo:搜索
                  this.dialogController.open()
                }else {
                  console.log("搜索：" + this.searchText)
                  router.pushUrl({
                    url: 'pages/Search_resort_Page',
                    params: {
                      searchString: this.searchText
                    }
                  })
                    .then(() => {
                      // success
                    })
                    .catch(err => {
                      console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
                    })
                }

              })
          }
          .width('100%')
          .height(50)

          Divider()
            .color(Color.Black)
          // .margin({ left: 20, right: 20, top: 10 })
        }
        //切换标签
        Tabs({ barPosition: BarPosition.Start, controller: this.tabsController }) {
          TabContent() {
            //市区选择标签
            this.listBuilder_strict()
          }
          .tabBar(this.TabBuilder('全部', 0))

          TabContent() {
            //景点选择标签
            this.listBuilder()
          }
          .tabBar(this.TabBuilder('船山区', 1))

          TabContent() {
            //景点选择标签
            this.listBuilder()
          }
          .tabBar(this.TabBuilder('安居区', 2))

          TabContent() {
            //景点选择标签
            this.listBuilder()
          }
          .tabBar(this.TabBuilder('射洪市', 3))

          TabContent() {
            //景点选择标签
            this.listBuilder()
          }
          .tabBar(this.TabBuilder('蓬溪县', 4))

          TabContent() {
            //景点选择标签
            this.listBuilder()
          }
          .tabBar(this.TabBuilder('大英县', 5))
        }
        .barWidth('100%')
        .barHeight(50)
        .onChange((index: number) => {
          this.currentIndex_district = index;
        })

      }.height('100%')
      .width('100%')
  }

  // 列表主体框架
  @Builder
  listBuilder() {
    Stack() {
      List() {
        ForEach(this.getResortsInfoList, (post) => {
          ListItem() {
            PostItem({ post: post })
          }
        })
      }.width('100%')
      .height('100%')
      .alignListItem(ListItemAlign.Center)


    }.width('100%')
    .layoutWeight(1)
    .alignContent(Alignment.BottomEnd)
  }

  //市区主题框架
  // 列表主体框架
  @Builder
  listBuilder_strict() {
    Stack() {
      List() {
        ForEach(this.getResortInfoList, (post) => {
          ListItem() {
            PostItem_strict({ post: post })
          }
        })
      }.width('100%')
      .height('100%')
      .alignListItem(ListItemAlign.Center)

    }.width('100%')
    .layoutWeight(1)
    .alignContent(Alignment.BottomEnd)
  }


}


// 自定义组件，打卡项
@Component
struct PostItem {
  // @ObjectLink post: PostInfo;
  @ObjectLink post: GetResortsInfo;

  build() {
    Column({ space: 10 }) {
      Row({ space: 10 }) {
        Image($r("app.media.resort2"))
          .height(50)
          .width(50)
          .borderRadius(20)
        Text(this.post.title)
          .height(40)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
        Blank()
        Text(this.post.position)
          .height(40)
          .fontSize(14)
          .fontColor('#999999')
          .fontWeight(FontWeight.Medium)
      }.width('100%')

      Text(this.post.createUser)
        .width('100%')
    }
    .padding(10)
    .width('90%')
    .margin({ top: 10 })
    .borderRadius(10)
    .shadow({ radius: 20 })
  }
}
// 自定义组件，打卡项
@Component
struct PostItem_strict {
  // @ObjectLink post: PostInfo;
  @ObjectLink post: GetResortInfo;

  build() {
    Column({ space: 10 }) {
      Row({ space: 10 }) {

        Image($r("app.media.resort1"))
          .height(50)
          .width(50)
          .borderRadius(20)
        Text(this.post.title)
          .height(40)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
        Blank()
        Text(this.post.title)
          .height(40)
          .fontSize(14)
          .fontColor('#999999')
          .fontWeight(FontWeight.Medium)
      }.width('100%')

      Text(this.post.createUser)
        .width('100%')
    }
    .padding(10)
    .width('90%')
    .margin({ top: 10 })
    .borderRadius(10)
    .shadow({ radius: 20 })
    .height("100vp")
  }
}

//输入不能为空弹窗
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void
  build() {
    Column() {
      Text('输入不能为空').fontSize(20).margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('cancel')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('confirm')
          .onClick(() => {
            this.controller.close()
            this.confirm()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })
    }
  }
}

@Extend(Text) function statTextStyle() {
  .width(100)
  .fontSize(16)
  .textAlign(TextAlign.End)
  .fontWeight(FontWeight.Medium)
  .fontColor(Color.White)
}