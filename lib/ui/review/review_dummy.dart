import '../../models/tag.dart';
import '../../models/review.dart';

final List<Review> reviewDummy = [
  Review(
    id: 1,
    content:
        '''돼지고기 끝판왕을 먹은 것 같아요. 진심으로 맛있습니다. 강추합니다. 예약 안하면, 대기해야 하는데 대기 장소가 애매해요. 무조건 18시 전까지 들어 가시길 권고합니다. 고기를 다 구워줘서 좀 편해요. 프로 그릴러가 구워서 그런지 굽기 상태도 딱 좋은 것 같아요.''',
    images: [
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
      'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
      'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80',
    ],
    nickname: '배고파서 슬픈 고라니',
    userId: 1,
    isHelpful: false,
    storeId: 1,
    tags: [
      {
        'emoji': '🍙',
        'title': '밥이 맛있어요.',
      },
      {
        'emoji': '🍰',
        'title': '디저트가 맛있어요.',
      },
      {
        'emoji': '☕️',
        'title': '커피가 맛있어요.',
      },
      {
        'emoji': '🍺',
        'title': '술이 맛있어요.',
      },
      {
        'emoji': '🛋',
        'title': '인테리어가 멋져요.',
      },
    ],
    createdDate: DateTime.now(),
  ),
  Review(
    id: 1,
    content: '''송파 방이옥 본점을 다녀오고
분위기도 맛도 좋아
조카와 방이옥 마곡점에 다녀왔어요.
역시나~~~맛있네요.
조카가 맛있게 먹어
기분좋았네요.
직접 고기 구워주셔서
편히 즐길 수 있는곳입니다.
친절하셔서
기분 좋게 식사할 수 있었어요.
반찬도 정갈하게 한상차려주는
너낌이라 많이 좋았네요.''',
    images: [
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
      'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
      'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80',
    ],
    nickname: '배고파서 슬픈 고라니',
    userId: 1,
    isHelpful: false,
    storeId: 1,
    tags: [
      {
        'emoji': '🍙',
        'title': '밥이 맛있어요.',
      },
      {
        'emoji': '🍰',
        'title': '디저트가 맛있어요.',
      },
      {
        'emoji': '☕️',
        'title': '커피가 맛있어요.',
      },
      {
        'emoji': '🍺',
        'title': '술이 맛있어요.',
      },
      {
        'emoji': '🛋',
        'title': '인테리어가 멋져요.',
      },
    ],
    createdDate: DateTime.now(),
  ),
  Review(
    id: 1,
    content: '''송파 방이옥 본점을 다녀오고
분위기도 맛도 좋아
조카와 방이옥 마곡점에 다녀왔어요.
역시나~~~맛있네요.
조카가 맛있게 먹어
기분좋았네요.
직접 고기 구워주셔서
편히 즐길 수 있는곳입니다.
친절하셔서
기분 좋게 식사할 수 있었어요.
반찬도 정갈하게 한상차려주는
너낌이라 많이 좋았네요.''',
    images: [
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
      'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
      'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80',
    ],
    nickname: '배고파서 슬픈 고라니',
    userId: 1,
    isHelpful: false,
    storeId: 1,
    tags: [
      {
        'emoji': '🍙',
        'title': '밥이 맛있어요.',
      },
      {
        'emoji': '🍰',
        'title': '디저트가 맛있어요.',
      },
      {
        'emoji': '☕️',
        'title': '커피가 맛있어요.',
      },
      {
        'emoji': '🍺',
        'title': '술이 맛있어요.',
      },
      {
        'emoji': '🛋',
        'title': '인테리어가 멋져요.',
      },
    ],
    createdDate: DateTime.now(),
  ),
  Review(
    id: 1,
    content: '''송파 방이옥 본점을 다녀오고
분위기도 맛도 좋아
조카와 방이옥 마곡점에 다녀왔어요.
역시나~~~맛있네요.
조카가 맛있게 먹어
기분좋았네요.
직접 고기 구워주셔서
편히 즐길 수 있는곳입니다.
친절하셔서
기분 좋게 식사할 수 있었어요.
반찬도 정갈하게 한상차려주는
너낌이라 많이 좋았네요.''',
    images: [
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
      'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
      'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80',
    ],
    nickname: '배고파서 슬픈 고라니',
    userId: 1,
    isHelpful: false,
    storeId: 1,
    tags: [
      {
        'emoji': '🍙',
        'title': '밥이 맛있어요.',
      },
      {
        'emoji': '🍰',
        'title': '디저트가 맛있어요.',
      },
      {
        'emoji': '☕️',
        'title': '커피가 맛있어요.',
      },
      {
        'emoji': '🍺',
        'title': '술이 맛있어요.',
      },
      {
        'emoji': '🛋',
        'title': '인테리어가 멋져요.',
      },
    ],
    createdDate: DateTime.now(),
  ),
  Review(
    id: 1,
    content: '''송파 방이옥 본점을 다녀오고
분위기도 맛도 좋아
조카와 방이옥 마곡점에 다녀왔어요.
역시나~~~맛있네요.
조카가 맛있게 먹어
기분좋았네요.
직접 고기 구워주셔서
편히 즐길 수 있는곳입니다.
친절하셔서
기분 좋게 식사할 수 있었어요.
반찬도 정갈하게 한상차려주는
너낌이라 많이 좋았네요.''',
    images: [
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
      'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
      'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80',
    ],
    nickname: '배고파서 슬픈 고라니',
    userId: 1,
    isHelpful: false,
    storeId: 1,
    tags: [
      {
        'emoji': '🍙',
        'title': '밥이 맛있어요.',
      },
      {
        'emoji': '🍰',
        'title': '디저트가 맛있어요.',
      },
      {
        'emoji': '☕️',
        'title': '커피가 맛있어요.',
      },
      {
        'emoji': '🍺',
        'title': '술이 맛있어요.',
      },
      {
        'emoji': '🛋',
        'title': '인테리어가 멋져요.',
      },
    ],
    createdDate: DateTime.now(),
  ),
  Review(
    id: 1,
    content: '''송파 방이옥 본점을 다녀오고
분위기도 맛도 좋아
조카와 방이옥 마곡점에 다녀왔어요.
역시나~~~맛있네요.
조카가 맛있게 먹어
기분좋았네요.
직접 고기 구워주셔서
편히 즐길 수 있는곳입니다.
친절하셔서
기분 좋게 식사할 수 있었어요.
반찬도 정갈하게 한상차려주는
너낌이라 많이 좋았네요.''',
    images: [
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
      'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
      'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80',
    ],
    nickname: '배고파서 슬픈 고라니',
    userId: 1,
    isHelpful: false,
    storeId: 1,
    tags: [
      {
        'emoji': '🍙',
        'title': '밥이 맛있어요.',
      },
      {
        'emoji': '🍰',
        'title': '디저트가 맛있어요.',
      },
      {
        'emoji': '☕️',
        'title': '커피가 맛있어요.',
      },
      {
        'emoji': '🍺',
        'title': '술이 맛있어요.',
      },
      {
        'emoji': '🛋',
        'title': '인테리어가 멋져요.',
      },
    ],
    createdDate: DateTime.now(),
  ),
  Review(
    id: 1,
    content: '''송파 방이옥 본점을 다녀오고
분위기도 맛도 좋아
조카와 방이옥 마곡점에 다녀왔어요.
역시나~~~맛있네요.
조카가 맛있게 먹어
기분좋았네요.
직접 고기 구워주셔서
편히 즐길 수 있는곳입니다.
친절하셔서
기분 좋게 식사할 수 있었어요.
반찬도 정갈하게 한상차려주는
너낌이라 많이 좋았네요.''',
    images: [
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
      'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
      'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80',
    ],
    nickname: '배고파서 슬픈 고라니',
    userId: 1,
    isHelpful: false,
    storeId: 1,
    tags: [
      {
        'emoji': '🍙',
        'title': '밥이 맛있어요.',
      },
      {
        'emoji': '🍰',
        'title': '디저트가 맛있어요.',
      },
      {
        'emoji': '☕️',
        'title': '커피가 맛있어요.',
      },
      {
        'emoji': '🍺',
        'title': '술이 맛있어요.',
      },
      {
        'emoji': '🛋',
        'title': '인테리어가 멋져요.',
      },
    ],
    createdDate: DateTime.now(),
  ),
  Review(
    id: 1,
    content: '''송파 방이옥 본점을 다녀오고
분위기도 맛도 좋아
조카와 방이옥 마곡점에 다녀왔어요.
역시나~~~맛있네요.
조카가 맛있게 먹어
기분좋았네요.
직접 고기 구워주셔서
편히 즐길 수 있는곳입니다.
친절하셔서
기분 좋게 식사할 수 있었어요.
반찬도 정갈하게 한상차려주는
너낌이라 많이 좋았네요.''',
    images: [
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
      'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
      'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80',
    ],
    nickname: '배고파서 슬픈 고라니',
    userId: 1,
    isHelpful: false,
    storeId: 1,
    tags: [
      {
        'emoji': '🍙',
        'title': '밥이 맛있어요.',
      },
      {
        'emoji': '🍰',
        'title': '디저트가 맛있어요.',
      },
      {
        'emoji': '☕️',
        'title': '커피가 맛있어요.',
      },
      {
        'emoji': '🍺',
        'title': '술이 맛있어요.',
      },
      {
        'emoji': '🛋',
        'title': '인테리어가 멋져요.',
      },
    ],
    createdDate: DateTime.now(),
  ),
  Review(
    id: 1,
    content: '''송파 방이옥 본점을 다녀오고
분위기도 맛도 좋아
조카와 방이옥 마곡점에 다녀왔어요.
역시나~~~맛있네요.
조카가 맛있게 먹어
기분좋았네요.
직접 고기 구워주셔서
편히 즐길 수 있는곳입니다.
친절하셔서
기분 좋게 식사할 수 있었어요.
반찬도 정갈하게 한상차려주는
너낌이라 많이 좋았네요.''',
    images: [
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
      'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
      'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80',
    ],
    nickname: '배고파서 슬픈 고라니',
    userId: 1,
    isHelpful: false,
    storeId: 1,
    tags: [
      {
        'emoji': '🍙',
        'title': '밥이 맛있어요.',
      },
      {
        'emoji': '🍰',
        'title': '디저트가 맛있어요.',
      },
      {
        'emoji': '☕️',
        'title': '커피가 맛있어요.',
      },
      {
        'emoji': '🍺',
        'title': '술이 맛있어요.',
      },
      {
        'emoji': '🛋',
        'title': '인테리어가 멋져요.',
      },
    ],
    createdDate: DateTime.now(),
  ),
  Review(
    id: 1,
    content: '''송파 방이옥 본점을 다녀오고
분위기도 맛도 좋아
조카와 방이옥 마곡점에 다녀왔어요.
역시나~~~맛있네요.
조카가 맛있게 먹어
기분좋았네요.
직접 고기 구워주셔서
편히 즐길 수 있는곳입니다.
친절하셔서
기분 좋게 식사할 수 있었어요.
반찬도 정갈하게 한상차려주는
너낌이라 많이 좋았네요.''',
    images: [
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80',
      'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80',
      'https://images.unsplash.com/photo-1529042410759-befb1204b468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80',
      'https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=690&q=80',
      'https://images.unsplash.com/photo-1481070555726-e2fe8357725c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=722&q=80',
    ],
    nickname: '배고파서 슬픈 고라니',
    userId: 1,
    isHelpful: false,
    storeId: 1,
    tags: [
      {
        'emoji': '🍙',
        'title': '밥이 맛있어요.',
      },
      {
        'emoji': '🍰',
        'title': '디저트가 맛있어요.',
      },
      {
        'emoji': '☕️',
        'title': '커피가 맛있어요.',
      },
      {
        'emoji': '🍺',
        'title': '술이 맛있어요.',
      },
      {
        'emoji': '🛋',
        'title': '인테리어가 멋져요.',
      },
    ],
    createdDate: DateTime.now(),
  ),
];

const List<Tag> dummyTags = [
  Tag(emoji: '🍙', title: '밥이 맛있어요.'),
  Tag(emoji: '🍰', title: '디저트가 맛있어요.'),
  Tag(emoji: '🍙', title: '밥이 맛있어요.'),
  Tag(emoji: '🍙', title: '밥이 맛있어요.'),
  Tag(emoji: '🍙', title: '밥이 맛있어요.'),
];
