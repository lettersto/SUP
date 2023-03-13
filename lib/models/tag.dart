class ReviewTag {
  final int tagNo; // id
  final String title;
  final String shortTitle;
  final String category;

  ReviewTag({
    required this.tagNo,
    required this.title,
    required this.shortTitle,
    required this.category,
  });

  ReviewTag.fromMap(Map<String, dynamic> data)
      : tagNo = data['tagNo'],
        title = data['value'],
        shortTitle = data['value_abbrv'],
        category = data['category'];
}

class ReviewTags {
  final List<ReviewTag> _tags;

  ReviewTags.fromJson(List<Map<String, dynamic>> json)
      : _tags = json.map((element) => ReviewTag.fromMap(element)).toList();

  List<ReviewTag> getTagsPerCategory(String category) {
    return _tags.where((tag) => tag.category == category).toList();
  }
}

const tagData = [
  {
    'tagNo': 0,
    'category': '음식/가격',
    'value': '💰 가성비가 좋아요',
    'value_abbrv': '💰가성비'
  },
  {
    'tagNo': 1,
    'category': '음식/가격',
    'value': '👨‍🍳 특별한 메뉴가 있어요',
    'value_abbrv': '👨‍🍳특별한메뉴'
  },
  {
    'tagNo': 2,
    'category': '음식/가격',
    'value': '🤤 음식이 맛있어요',
    'value_abbrv': '🤤맛있는'
  },
  {
    'tagNo': 3,
    'category': '음식/가격',
    'value': '🔎 종류가 다양해요',
    'value_abbrv': '🔎다양'
  },
  {
    'tagNo': 4,
    'category': '음식/가격',
    'value': '🍙 혼자 가기 좋아요',
    'value_abbrv': '🍙혼자'
  },
  {
    'tagNo': 5,
    'category': '분위기',
    'value': '📸 사진이 잘 나와요',
    'value_abbrv': '📸사진'
  },
  {
    'tagNo': 6,
    'category': '분위기',
    'value': '💬 대화하기 좋아요',
    'value_abbrv': '💬대화'
  },
  {'tagNo': 7, 'category': '분위기', 'value': '🏞️ 뷰가 좋아요', 'value_abbrv': '🏞️뷰'},
  {
    'tagNo': 8,
    'category': '분위기',
    'value': '💻 집중하기 좋아요',
    'value_abbrv': '💻집중'
  },
  {
    'tagNo': 9,
    'category': '분위기',
    'value': '🛋️ 인테리어가 멋져요',
    'value_abbrv': '🛋️인테리어'
  },
  {
    'tagNo': 10,
    'category': '편의시설/기타',
    'value': '🚻 화장실이 깨끗해요',
    'value_abbrv': '🚻화장실'
  },
  {
    'tagNo': 11,
    'category': '편의시설/기타',
    'value': '🪑 좌석이 편해요',
    'value_abbrv': '🪑좌석'
  },
  {
    'tagNo': 12,
    'category': '편의시설/기타',
    'value': '🅿️ 주차하기 편해요',
    'value_abbrv': '🅿️주차'
  },
  {
    'tagNo': 13,
    'category': '편의시설/기타',
    'value': '💓 친절해요',
    'value_abbrv': '💓친절'
  },
  {
    'tagNo': 14,
    'category': '편의시설/기타',
    'value': '✨ 매장이 청결해요',
    'value_abbrv': '✨청결'
  },
];
