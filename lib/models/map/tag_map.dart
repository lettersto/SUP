class MapTag {
  final String emoji;
  final String tagName;
  final bool selected;
  final int code;

  MapTag(this.emoji, this.tagName, this.code, this.selected);

  String getEmojiTagName() {
    return emoji + tagName;
  }
}

List<MapTag> cates = [
  MapTag("🥘", "한식", 1000, false),
  MapTag("🥪", "분식", 1001, false),
  MapTag("🍣", "일식", 1002, false),
  MapTag("🍝", "양식", 1003, false),
  MapTag("🥟", "중식", 1004, false),
  MapTag("🍛", "아시안음식", 1005, false),
  MapTag("☕️", "카페", 1006, false),
  MapTag("🍗", "치킨/피자", 1007, false),
  MapTag("🍺", "주류", 1008, false),
  MapTag("🍽", "기타", 1009, false),
];

List<MapTag> tags = [
  MapTag("💰", "가성비", 3, false),
  MapTag("👨‍🍳", "특별한메뉴", 4, false),
  MapTag("🤤", "맛있는", 5, false),
  MapTag("🔎", "다양", 6, false),
  MapTag("🍙", "혼자", 7, false),
  MapTag("📸", "사진", 8, false),
  MapTag("💬", "대화", 9, false),
  MapTag("🏞️", "뷰", 10, false),
  MapTag("💻", "집중", 11, false),
  MapTag("🛋️", "인테리어", 12, false),
  MapTag("🚻", "화장실", 13, false),
  MapTag("🪑", "좌석", 14, false),
  MapTag("🅿️", "주차", 15, false),
  MapTag("💓", "친절", 16, false),
  MapTag("✨", "청결", 17, false),
];
