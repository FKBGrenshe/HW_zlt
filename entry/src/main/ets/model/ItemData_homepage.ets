// 银茂旭，主页界面结构体

export default class ItemData{
  title: string;
  image: Resource;

  constructor(title: string, image: Resource) {
    this.title = title;
    this.image = image;
  }
}