class ImageReview {
  final String imageUrl;

  const ImageReview({required this.imageUrl});

  // TODO change fromJSON with actual api
  factory ImageReview.fromJson(Map<String, dynamic> json) {
    return ImageReview(imageUrl: json['avatar']);
  }
}
