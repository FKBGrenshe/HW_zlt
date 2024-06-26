// 银茂旭，主页界面结构体

export default class ItemData{
  title: string;
  image: Resource;
  url: string;

  constructor(title: string, image: Resource, url:string) {
    this.title = title;
    this.image = image;
    this.url = url;
  }
}