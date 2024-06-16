
import ItemData from './ItemData_mallpage';


export class MallViewModel {

  getFirstGridData(): Array<ItemData> {
    let firstGridData: ItemData[] = [
      new ItemData('tudou', $r('app.media.food1'),7.9,35,1),
      new ItemData('果酒', $r('app.media.food5'),9.9,30,1),
      new ItemData('美的电饭煲', $r('app.media.food6'),88.88,30,1),
      new ItemData('面都精华', $r('app.media.food7'),168,25,1),
      new ItemData('五香豆腐干', $r('app.media.food2'),0.99,400,1),

      new ItemData('肉松麻花', $r('app.media.food3'),15,19,1),
      new ItemData('美式爆米花', $r('app.media.food4'),9.9,1000,1),
      new ItemData('抹茶粉', $r('app.media.food8'),19.9,26,1),

      new ItemData('2', $r('app.media.circle'),1,1,1)
    ];
    return firstGridData;
  }

  findItemByTitle(title: string): ItemData | undefined {
    let firstGridData = this.getFirstGridData();
    return firstGridData.find(item => item.title === title);
  }

  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
      $r('app.media.cartbk1'),
      $r('app.media.cartbk2'),
      $r('app.media.cartbk3'),
      $r('app.media.cartbk4')
    ];
    return swiperImages;
  }
}

export default new MallViewModel();


