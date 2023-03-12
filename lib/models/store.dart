class Store{
  String name;
  double latitude;
  double longitude;
  String rate;
  int reviewCnt;
  bool like;
  List<String> urls = ["https://user-images.githubusercontent.com/33195517/223587973-bef58c82-ebfd-40c4-9253-728c8dbbbd43.png", "https://user-images.githubusercontent.com/33195517/223588012-52400d2c-f6dd-4695-a266-442099071970.png", "https://user-images.githubusercontent.com/33195517/223588062-3fa6d458-2f2b-4657-a584-1025e2e20ca8.png"];

  Store(this.name, this.latitude, this.longitude, this.rate, this.reviewCnt, this.like);
}