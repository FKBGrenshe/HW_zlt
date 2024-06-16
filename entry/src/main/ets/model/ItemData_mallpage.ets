//潘梦莹，商城中物品结构体
export default class PageResource {

  title: string;
  img: Resource;
  price: Number;
  sold:Number;
  count:number

  constructor(title: string, img: Resource, price:Number,sold:Number, count:number) {
    this.title = title;
    this.img = img;
    this.price = price;
    this.sold=sold
    this.count=count
  }


}
