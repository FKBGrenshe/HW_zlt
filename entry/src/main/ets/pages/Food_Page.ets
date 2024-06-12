import { PostInfo } from '../model/ItemData_foodpage'
import router from '@ohos.router'

import {getAllFood} from '../Utils/Api'

@Entry
@Component
struct Index {

  @State title: string = '地道美食'
  @State postInfoList: PostInfo[] = null;

  aboutToAppear(){
    this.get()
  }

  get(){
    getAllFood().then(res=>{
      console.log(res.data.data);
      this.postInfoList = res.data.data.records.map(item => {
        return new PostInfo(item)
      })
    })
  }
  // 列表主体框架
  build() {
    Scroll() {
      Column() {
        Row() {

          Button({ type: ButtonType.Normal, stateEffect: true })
          {
            Image($r('app.media.return'))
          }
          .borderRadius(8)
          .height('60%')
          .width(60)
          .onClick(() => {
            router.pushUrl({ url: 'pages/Index' })
          })
          .margin({left:8, top:8, bottom:8})

          Text(this.title)
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
            .height('80%')
        }
        .width('100%')
        .backgroundColor(0x48cda1)
        .height(60)


        Row() {
          TextInput({ placeholder: '查询' })
            .width('70%')
            .height(40)
            .backgroundColor('#FFFFFF')
            .margin({ top: 8 })

          Button('搜索', { type: ButtonType.Normal, stateEffect: true })
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(90)
            .margin({ left: 10, top: 8 })
            .onClick(() => {
              console.log('ButtonType.Normal')
            })
        }
        .margin({ left: 15, top: 10 })
        .height(50)

        this.listBuilder()

      }
      .width('100%')
      .align(Alignment.TopStart)
      .height('100%')
    }
  }


  @Builder
  listBuilder() {
    List() {
      ForEach(this.postInfoList, (post) => {
        ListItem() {
          ShowItem({ post: post }).height("20%")
        }
      })
    }
    .width('100%')
    .alignListItem(ListItemAlign.Center)
    .margin({top:8})
  }


}


// 自定义组件，展示项
@Component
struct ShowItem {
  @ObjectLink post: PostInfo;

  build() {
    Column(){
      Row() {
        Image($r('app.media.food'))
          .width('30%')
          .height('80%')
        Column(){
          Text(String(this.post.id))
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .height('30%')
            .textAlign(TextAlign.Center)
          Text(this.post.foodType)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .height('30%')
            .textAlign(TextAlign.Center)
          Text(this.post.createDate)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .height('30%')
            .textAlign(TextAlign.Center)
        }
        .width('60%')
        .margin({left:8})
      }

      Divider()
    }
  }
}

