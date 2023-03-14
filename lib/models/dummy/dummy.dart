class ImageReview {
  final String imageUrl;

  const ImageReview({required this.imageUrl});

  // TODO change fromJSON with actual api
  factory ImageReview.fromJson(Map<String, dynamic> json) {
    return ImageReview(imageUrl: json['avatar']);
  }
}

// model
class ReviewFormField {
  // final int storeNo;
  // final int userNo;
  String content = ''; // comment.length [1,400]
  int star = 0; // [1,5]
  List<int> tag = []; // tags.length [1,5]
  // final imgs;  // TODO find the way to send images in flutter

  ReviewFormField();

  Map<String, dynamic> toMap() {
    return {
      // 'storeNo': storeNo,
      // 'userNo': userNo,
      'content': content,
      'star': star,
      'tag': tag,
    };
  }
}
