
import router from '@ohos.router'
import {get_selectOneMall} from '../Utils/Api'

import MallViewModel from '../model/MallViewModel';
import ItemData from '../model/ItemData_mallpage';


@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  cancel: () => void
  confirm: () => void
  itemTitle: string

  private item: ItemData | null = null;
  // 接收传入的参数
  aboutToAppear() {
      this.find(this.itemTitle);
  }

  private find(itemTitle: string) {
    this.item = MallViewModel.findItemByTitle(itemTitle);
    if (this.item) {
      console.log('Found item:', this.item);
    } else {
      console.log('Item not found');
    }
  }
  // 添加到购物车功能
  private addToCart(itemTitle: string) {
    router.pushUrl({ url: 'view/Shopping',params: {itemTitle:itemTitle} })
  }

  build() {
    Column() {
      if (this.item) {
        Image(this.item.img)
          .width('100%')
          .height('160vp')
          .borderRadius('8vp')
          .margin({ top: '8vp', left: '8vp', right: '8vp' });

        Text(this.item.title)
          .fontSize('16fp')
          .fontWeight(FontWeight.Bold)
          .margin({ top: '8vp', left: '8vp', right: '8vp' });

        Text(`￥${this.item.price}`)
          .fontSize('16fp')
          .margin({ top: '4vp', left: '8vp' });

        Row({ space: 20 }) {
          Text(`已售${this.item.sold}`)
            .fontSize('12fp')
            .fontColor(Color.Gray)
            .margin({ left: '8vp' });

          Image($r('app.media.cart'))
            .width('24vp')
            .height('24vp')
            .onClick(() => this.addToCart(this.item.title))
            .margin({ right: '8vp' })

        }
        .margin({ top: '8vp' });

      } else {
        Text('Loading...')
          .fontSize('16fp')
          .margin({ top: '20vp', left: '8vp', right: '8vp' });
      }
      // Text('内容').fontSize(20).margin({ top: 10, bottom: 10 })
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .onClick(() => {
            this.controller.close()
            this.cancel()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
        // Button('')
        //   .onClick(() => {
        //     this.controller.close()
        //     this.confirm()
        //   }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 })
    }
  }
}


@Entry
@Component
export default struct MallHome {
  private swiperController: SwiperController = new SwiperController();
  scroller: Scroller = new Scroller();
  private cart: ItemData[] = []; // 购物车数组
  @State idNumber:string = ""
  @State name:string = ""

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: this.onCancel,
      confirm: this.onAccept,
      itemTitle: this.name // 传入参数
    }),
    alignment: DialogAlignment.Default,  // 可设置dialog的对齐方式，设定显示在底部或中间等，默认为底部显示
  })
  onCancel() {
    console.info('Callback when the first button is clicked')
  }
  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  // 添加到购物车功能
  private addToCart(itemTitle: string) {
    router.pushUrl({ url: 'view/Shopping',params: {itemTitle:itemTitle} })
  }

  build() {
    Scroll(this.scroller) {
      Column() {

        Text('遂宁商城')
          .fontWeight(FontWeight.Bold) // 使用粗体
          .fontSize('30fp') // 增大字体
          .fontColor(Color.Black)
          .margin({ top: '12vp' })
          .padding({ left: '12vp' })

        Stack() {
          Image($r("app.media.background1"))
            .width('100%')
            .height('200vp')
            // .objectFit(ObjectFit.Cover)
          Column() {

            Text('优质商品尽在这里')
              .fontWeight(FontWeight.Bold) // 使用粗体
              .fontSize('18fp') // 调整字体大小
              .fontColor(Color.Black) // 颜色调整为白色
              .margin({ top: '5vp', left: '0vp' }) // 调整位置
              .padding({ left: '12vp', right: '12vp' }) // 增加内边距

          }
          .width('100%')
          .height('200vp')

        }
        .width('100%')


        // 搜索栏
        Row() {
          TextInput({ placeholder: '搜索商品', text: this.name })
            .onChange(value => {
              console.log(value);
              this.name = value;
            })
            .width('80%')
            .padding({ left: '12vp', right: '12vp' });

          Button('搜索')
            .onClick(() => {
              console.log("正在搜索中");
              // 使用示例

              // 方式一：联通后台中的美食分类的selectOne
              // get_selectOneMall(this.name).then(res=>{
              //   console.log(JSON.stringify(res));
              //   this.idNumber = res.data.data.foodType;
              // })
              //   .catch(error=>{
              //     console.log(JSON.stringify(error))
              //   })
              // 方式二：使用自定义弹窗
              let item =MallViewModel.findItemByTitle(this.name);
              if (item) {
                console.log('Found item:', item);
                this.name=item.title
              } else {
                console.log('Item not found');
                this.name=null
              }
              this.dialogController.open()



            })
        }
        .margin({ top: '12vp', bottom: '12vp' })
        .padding({ left: '12vp', right: '12vp' })

        Text(this.idNumber)

        Grid() {
          ForEach(MallViewModel.getFirstGridData(), (item: ItemData) => {
            GridItem() {
              Column() {
                Image(item.img)
                  .width('100%')
                  .height('160vp')
                  // .objectFit(ObjectFit.Cover)
                  .borderRadius('8vp')

                Text(item.title)
                  .fontSize('16fp')
                  .fontWeight(FontWeight.Bold)
                  .margin({ top: '8vp', left: '8vp', right: '8vp' })

                Text(`￥${item.price}`)
                  .fontSize('16fp')
                  .margin({ top: '4vp', left: '8vp' })

                Row({space:20}) {
                  Text(`已售${item.sold}`)
                    .fontSize('12fp')
                    .fontColor(Color.Gray)
                    .margin({ left: '8vp' })

                  Image($r('app.media.cart'))
                    .width('24vp')
                    .height('24vp')
                    .onClick(() => this.addToCart(item.title))
                    .margin({ right: '8vp' })
                }
                .margin({ top: '8vp' })
              }
              .padding('8vp')
              .backgroundColor(Color.White)
              .borderRadius('8vp')

            }
          }, (item: ItemData) => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr')
        .rowsGap('12vp')
        .columnsGap('12vp')
        .padding({ top: '12vp', bottom: '12vp', left: '12vp', right: '12vp' })

      }
      .height('100%')
    }
    .backgroundColor('0xDCDCDC')
    .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Gray) // 滚动条颜色
    .scrollBarWidth(10) // 滚动条宽度
    .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
  }
}




