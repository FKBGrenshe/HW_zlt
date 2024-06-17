// 主页界面
import ItemData from '../model/ItemData_homepage'
import router from '@ohos.router'

@Entry
@Component
export struct HomePage {
  @State colorIndex: number = 0
  private swiperController: SwiperController = new SwiperController()
  scroller1: Scroller = new Scroller()
  scroller2: Scroller = new Scroller()
  inputController: TextInputController = new TextInputController()
  videoController: VideoController = new VideoController()

  // 热门活动图片
  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
    $rawfile("media/homepage/activity1.png"),
    $rawfile('media/homepage/activity2.png')
    ];
    return swiperImages;
  }

  // 游玩咨询数据
  getInfoItems(): Array<ItemData>{
    let infoItems: ItemData[] = [
      new ItemData('端午去哪儿玩？免费！遂宁川剧团惠民演出精彩剧', $rawfile('media/homepage/info1.png')),
      new ItemData('培江诗画长廊 | 这些小众人文景点，端午正好游！', $rawfile('media/homepage/info2.png')),
      new ItemData('端午去哪儿玩？明天报名！遂宁市非遗宣传展示节', $rawfile('media/homepage/info3.png'))
    ];
    return infoItems;
  }

  // 板块数据
  getGridItems(): Array<ItemData>{
    let gridItems: ItemData[] = [
      new ItemData('酒店名宿', $rawfile('media/homepage/hotel.png')),
      new ItemData('地道美食', $rawfile('media/homepage/restaurant.png')),
      new ItemData('热门景区', $rawfile('media/homepage/site.png')),
      new ItemData('文化艺术', $rawfile('media/homepage/culture.png')),
      new ItemData('文化场馆', $rawfile('media/homepage/museum.png')),
      new ItemData('停车场', $rawfile('media/homepage/parking.png')),
      new ItemData('精品路线', $rawfile('media/homepage/route.png')),
      new ItemData('遂宁特产', $rawfile('media/homepage/shop.png')),
      new ItemData('旅游咨询', $rawfile('media/homepage/travelquery.png')),
      new ItemData('文化遗产', $rawfile('media/homepage/heritage.png')),
      new ItemData('公交信息', $rawfile('media/homepage/trans.png')),
      new ItemData('找厕所', $rawfile('media/homepage/toilet.png'))
    ];
    return gridItems;
  }

  build() {
    Scroll(this.scroller1){
      Column(){
        Stack({alignContent: Alignment.Top}){
          Image($rawfile('media/homepage/home_back.jpg'))
            .sourceSize({width: 100, height: 50})
            .align(Alignment.Top)
            .margin({top: 20})
          Row(){
            TextInput({placeholder: '搜索目的地/酒店/活动等'})
              .width('70%')
              .height(35)
              .margin({top: 10})

            Button(){
              Image($rawfile('media/homepage/cilentservice.png'))
                .width(25)
                .height(25)
            }
            .width(35)
            .height(35)
            .type(ButtonType.Circle)
            .backgroundColor('#F5F5F5')
            .margin({top: 10, left: 10})
          }
        }

        Grid(){
          ForEach(this.getGridItems(), (item: any) => {
            GridItem(){
              Button(){
                Column(){
                  Image(item.image)
                    .width(40)
                    .height(40)

                  Text(item.title)
                    .margin({top: 5})
                }
              }
              .type(ButtonType.Normal)
              .borderRadius(10)
              .backgroundColor('#F5F5F5')
              .stateEffect(false)
              .onClick(() => {
                router.pushUrl({ url: 'pages/Food_Page' })
              })
            }
            .backgroundColor('#F5F5F5')
            .borderRadius(10)
          })
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr')
        .columnsGap(5)
        .rowsGap(5)
        .width('90%')
        .backgroundColor(Color.White)
        .height(230)
        .margin({top: 20})

        Row(){
          Image($rawfile('media/homepage/fire.png'))
            .width(20)
            .height(20)
            .margin({left: 10})

          Text('热门活动')
            .fontWeight(FontWeight.Bolder)

          Button(){
            Text('更多>')
          }
          .margin({left: 210})
          .backgroundColor(Color.White)
        }
        .height(30)
        .width('100%')
        .margin({top: 20})

        Swiper(this.swiperController){
          ForEach(this.getSwiperImages(), (item: any) => {
            Button(){
              Image(item)
            }
            .backgroundColor(Color.White)
            .stateEffect(false)
          })
        }
        .height(150)
        .width('86%')
        .borderRadius(10)
        .margin({top: 5})

        Row(){
          Image($rawfile('media/homepage/calender.png'))
            .width(20)
            .height(20)
            .margin({left: 10})

          Text('游玩资讯')
            .fontWeight(FontWeight.Bolder)

          Button(){
            Text('更多>')
          }
          .margin({left: 210})
          .backgroundColor(Color.White)
        }
        .height(30)
        .width('100%')
        .margin({top: 20})

        Video({
          src: $rawfile('media/homepage/advertise.mp4'),
          previewUri: $rawfile('media/homepage/preview.jpg')
        })
        .width('86%').height(150)
        .borderRadius(10)

        Scroll(this.scroller2){
          Row(){
            ForEach(this.getInfoItems(), (item: any) => {
              Button(){
                Column(){
                  Image(item.image)
                    .width(150)
                    .height(200)
                    .borderRadius(10)

                  Text(item.title)
                    .margin({top: 5})
                    .width(150)
                    .height(65)
                }
                .margin({left: 20})
              }
              .backgroundColor(Color.White)
              .stateEffect(false)
            })
          }
        }
        .scrollBar(BarState.Off)
        .scrollable(ScrollDirection.Horizontal)
        .margin({top: 10})
      }
    }
    .scrollBar(BarState.Off)
  }
}