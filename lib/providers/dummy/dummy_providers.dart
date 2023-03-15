import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/dummy_api.dart';
import '../../models/dummy/tag.dart';
import '../../models/dummy/dummy.dart';

// ===== image review =====
final apiProvider = Provider<DummyApi>((ref) => DummyApi());
final imageReviewProvider = FutureProvider<List<ImageReview>>(
    (ref) => ref.read(apiProvider).getImageReviews());

final reviewTagsProvider = Provider((ref) => ReviewTags.fromJson(tagData));
