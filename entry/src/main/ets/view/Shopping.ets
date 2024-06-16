import ItemData from '../model/ItemData_mallpage';
import router from '@system.router';
import MallViewModel from '../model/MallViewModel';

@Entry
@Component
export default struct Shopping {
  // 构建方法
  private itemTitle: string = '';

  private item: ItemData | null = null;
  private swiperController: SwiperController = new SwiperController();


  aboutToAppear() {
    const params = router.getParams();
    if (params && params.itemTitle) {
      this.itemTitle = params.itemTitle as string;
      this.find(this.itemTitle);
    }

  }


  // 查找方法
  private find(itemTitle: string) {
    this.item = MallViewModel.findItemByTitle(itemTitle);
    if (this.item) {
      console.log('Found item:', this.item);
    } else {
      console.log('Item not found');
    }
  }

  build() {
    Column() {

      Text('您的购物车')
        .fontWeight(FontWeight.Bold) // 使用粗体
        .fontSize('30fp') // 增大字体
        .fontColor(Color.Black)
        .margin({ top: '12vp' })
        .padding({ left: '12vp' })
      // 轮播图
      Swiper(this.swiperController) {
        ForEach(MallViewModel.getSwiperImages(), (img: Resource) => {
          Image(img)
            .width('100%')
            .borderRadius('12vp')
        }, (img: Resource) => JSON.stringify(img.id))
      }
      .margin({ top: '24vp' })
      .height('200vp')
      .autoPlay(true) // 自动轮播

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

        }
        .margin({ top: '8vp' });
      } else {
        Text('Loading...')
          .fontSize('16fp')
          .margin({ top: '20vp', left: '8vp', right: '8vp' });
      }
      Button('返回首页')
        .onClick(() => {
          router.back(
          );
        })
    }
    .padding('8vp')
    .backgroundColor(Color.White)
    .borderRadius('8vp');



  }


  // build() {

    //   Column() {
    //     Row() {
    //       Image(this.item.img)
    //         .width(100)
    //         .height(100)
    //
    //       Column() {
    //         Text(this.item.title)
    //           .fontSize(16)
    //           .fontWeight(FontWeight.Bold)
    //
    //         Text('￥' + this.item.price)
    //           .fontSize(14)
    //           .fontWeight(FontWeight.Normal)
    //       }
    //       .padding(10)
    //     }
    //     .padding({ bottom: 20 })
    //
    //     Row() {
    //       Button('-')
    //         .fontSize(20)
    //         .onClick(() => {
    //           if (this.item.count > 1) {
    //             this.item.count--;
    //             console.log('minus')
    //           }
    //         })
    //
    //       Text(this.item.count.toString())
    //         .fontSize(20)
    //         .padding({ left: 10, right: 10 })
    //
    //       Button('+')
    //         .fontSize(20)
    //         .onClick(() => {
    //           this.item.count++;
    //           console.log('add');
    //         })
    //     }
    //   }
    //   .width('100%')
    //   .padding(20)
    // }
  // }


}