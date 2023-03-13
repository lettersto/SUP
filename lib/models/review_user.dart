class ReviewUser {
  final String nickname;
  final int reviewCnt;
  final double starAvg; // star rating average

  ReviewUser({
    required this.nickname,
    this.reviewCnt = 24,
    this.starAvg = 3.5,
  });

  factory ReviewUser.fromJson(Map<String, dynamic> json) {
    return ReviewUser(
      nickname: json['name'], // 나중에 api에 맞게 바꾸기
    );
  }
}
