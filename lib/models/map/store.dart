class Store {
  int storeNo;
  String name;
  double latitude;
  double longitude;
  String rate;
  int reviewCnt;
  bool like;
  List<String> urls = [
    "https://user-images.githubusercontent.com/33195517/223587973-bef58c82-ebfd-40c4-9253-728c8dbbbd43.png",
    "https://user-images.githubusercontent.com/33195517/223588012-52400d2c-f6dd-4695-a266-442099071970.png",
    "https://user-images.githubusercontent.com/33195517/223588062-3fa6d458-2f2b-4657-a584-1025e2e20ca8.png"
  ];
  List<String> reviews = [
    "오래된 우리나라 지도우리집에는 용납 안되는것들이 이곳에서는 작품이네요. 커피도 맛있고 찾는 즐거움까지",
    "너무너무너무마싯땅~~~!",
    "메가커피는 어디라도 좋아요~! 근데 점심시간에 잠깐 앉았다 가려고 테이크아웃잔에 시켰더니 후이이이이기깅 ㅑㄴㅁ냐먀냐먄ㅁㅁㅁㅁㅁㅁ"
  ];

  Store(this.storeNo, this.name, this.latitude, this.longitude, this.rate,
      this.reviewCnt, this.like);
}

class MyLatLng {
  double latitude;
  double longitude;

  MyLatLng(this.latitude, this.longitude);
}

class LikeStore {
  int storeNo;
  MyLatLng location;

  LikeStore(this.storeNo, this.location);
}

List<Store> stores = [
  Store(1, "맘스터치", 37.563063, 126.831237, "4.37", 1218, false),
  Store(2, "산청숯불가든", 37.561036, 126.836975, "3.3", 344, true),
  Store(3, "유나식당", 37.561036, 126.839975, "4.66", 13, false)
];
