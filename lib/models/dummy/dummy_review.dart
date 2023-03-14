class Review {
  final int id;
  final String content;
  final List<String> images;
  final String nickname;
  final int userId;
  final bool isHelpful;
  final List<Map<String, String>> tags;
  final int storeId;
  final DateTime createdDate;

  Review({
    required this.id,
    required this.content,
    required this.images,
    required this.nickname,
    required this.userId,
    required this.isHelpful,
    required this.tags,
    required this.storeId,
    required this.createdDate,
  });
}
