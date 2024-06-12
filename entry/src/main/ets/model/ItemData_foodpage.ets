// 郭睿，热门美食结构体

@Observed
export class PostInfo {
  id: number;
  foodType: string;
  des: String;
  createUser: string;
  createDate: string

  constructor(post:{id: number, foodType: string, des: string, createUser: string, createDate: string}) {
    this.id = post.id;
    this.foodType = post.foodType;
    this.des = post.des;
    this.createUser = post.createUser;
    this.createDate = post.createDate;
  }
}