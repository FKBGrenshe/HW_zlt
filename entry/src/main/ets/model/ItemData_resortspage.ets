//陈炳宇 热门景点页面结构体

@Observed
export class PostInfo {
  id: number;
  postText: string;
  rightCount: number;
  answeredCount: number;
  timeUsed: number;
  createTime: string;
  likeCount: number;
  nickname: string;
  avatarUrl: string
  isLike: boolean;

  constructor(post:{id: number, postText: string, rightCount: number, answeredCount: number, timeUsed: number, createTime: string, likeCount: number, nickname: string, avatarUrl: string, isLike: boolean}) {
    this.id = post.id;
    this.postText = post.postText;
    this.rightCount = post.rightCount;
    this.answeredCount = post.answeredCount;
    this.timeUsed = post.timeUsed;
    this.createTime = post.createTime;
    this.likeCount = post.likeCount;
    this.nickname = post.nickname;
    this.avatarUrl = post.avatarUrl;
    this.isLike = post.isLike;
  }
}

// 市区
@Observed
export class GetResortInfo {
  id: number;
  title: string;
  des: string;
  point: number;
  createUser: string;
  createDate: string;

  constructor(post:{id: number, title: string, des: string, point: number, createUser: string, createDate: string}) {
    this.id = post.id;
    this.title = post.title;
    this.des = post.des;
    this.point = post.point;
    this.createUser = post.createUser;
    this.createDate = post.createDate;
  }
}

// 景点
@Observed
export class GetResortsInfo {

  id: string;
  title: string;
  content: string;
  contentUrl: string;
  type:number;
  status:number;
  readNum:number;
  collNum:number;
  shareNum:number;
  likeNum:number;
  popular:number;
  popType:number;
  touType:string;
  createUser:string;
  createDate:string;
  modifyUser:string;
  modifyDate:string;
  hotelId:string;
  levelStar:number;
  artSort:number;
  subtitle:string;
  openTime:string;
  position:string;
  posDes:string;
  reserTell:string;
  hotelLabels:string;
  foodType:string;
  specialProduct:string;
  specialPrice:string;
  reserType:string;
  heritageType:string;
  heritageTime:string;
  notice:string;
  tips:string;
  tickets:string;
  belongType:string;
  recAddr:string;
  specFrom:string;
  madeBy:string;
  national:string;
  activityUrl:string;
  activitySkip:string;
  current:number;
  size:number;

  constructor(get:{ id: string,title: string,content: string,contentUrl: string,type:number,status:number,readNum:number,collNum:number,shareNum:number,likeNum:number,popular:number,popType:number,touType:string,createUser:string,createDate:string,modifyUser:string,modifyDate:string,hotelId:string,levelStar:number,artSort:number,subtitle:string,openTime:string,position:string,posDes:string,reserTell:string,hotelLabels:string,foodType:string,specialProduct:string,specialPrice:string,reserType:string,heritageType:string,heritageTime:string,notice:string,tips:string,tickets:string,belongType:string,recAddr:string,specFrom:string,madeBy:string,national:string,activityUrl:string,activitySkip:string,current:number,size:number,
  }){
    this.id = get.id;
    this.title = get.title;
    this.content = get.content;
    this.contentUrl = get.contentUrl;
    this.type = get.type;
    this.status = get.status;
    this.readNum = get.readNum;
    this.collNum = get.collNum;
    this.shareNum = get.shareNum;
    this.likeNum = get.likeNum;
    this.popular = get.popular;
    this.popType = get.popType;
    this.touType = get.touType;
    this.createUser = get.createUser;
    this.createDate = get.createDate;
    this.modifyUser = get.modifyUser;
    this.modifyDate = get.modifyDate;
    this.hotelId = get.hotelId;
    this.levelStar = get.levelStar;
    this.artSort = get.artSort;
    this.subtitle = get.subtitle;
    this.openTime = get.openTime;
    this.position = get.position;
    this.posDes = get.posDes;
    this.reserTell = get.reserTell;
    this.hotelLabels = get.hotelLabels;
    this.foodType = get.foodType;
    this.specialProduct = get.specialProduct;
    this.specialPrice = get.specialPrice;
    this.reserType = get.reserType;
    this.heritageType = get.heritageType;
    this.heritageTime = get.heritageTime;
    this.notice = get.notice;
    this.tips = get.tips;
    this.tickets = get.tickets;
    this.belongType = get.belongType;
    this.recAddr = get.recAddr;
    this.specFrom = get.specFrom;
    this.madeBy = get.madeBy;
    this.national = get.national;
    this.activityUrl = get.activityUrl;
    this.activitySkip = get.activitySkip;
    this.current = get.current;
    this.size = get.size;
  }

  // id: number;
  // title: string;
  // des: string;
  // point: number;
  // createUser: string;
  // createDate: string;
  //
  // constructor(post:{id: number, title: string, des: string, point: number, createUser: string, createDate: string}) {
  //   this.id = post.id;
  //   this.title = post.title;
  //   this.des = post.des;
  //   this.point = post.point;
  //   this.createUser = post.createUser;
  //   this.createDate = post.createDate;
  // }
}

// @Observed
// export class GetResortInfo {
//   id: number;
//   title: string;
//   des: string;
//   point: number;
//   createUser: string;
//   createDate: string;
//
//   constructor(id: number, title: string, des: string, point: number, createUser: string, createDate: string) {
//     this.id = id;
//     this.title = title;
//     this.des = des;
//     this.point = point;
//     this.createUser = createUser;
//     this.createDate = createDate;
//   }
// }