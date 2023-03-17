import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/review/review_form_provider.dart';
import '../../providers/review/review_provider.dart';
import '../../providers/store/store_detail_provider.dart';
import '../../utils/styles.dart';
import '../../utils/app_utils.dart';
import '../../utils/sharedPreference_util.dart';

import './form_field/star_rating/star_rating_area.dart';
import './form_field/tag_selection/tag_selection_area.dart';
import './form_field/comment/comment_text_field.dart';
import './form_field/add_photo/add_photo.dart';

class ReviewForm extends ConsumerStatefulWidget {
  const ReviewForm({super.key});

  @override
  ConsumerState<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends ConsumerState<ReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final _starRatingKey = GlobalKey();
  final _tagsKey = GlobalKey();
  final _commentController = TextEditingController();
  bool _isFormValid = false;

  void _setComment() {
    ref
        .read(reviewFormProvider.notifier)
        .setContent(_commentController.text.trim());
  }

  Future scrollToWidget(GlobalKey key) async {
    final context = key.currentContext;
    await Scrollable.ensureVisible(context!,
        duration: const Duration(milliseconds: 800));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    if (!ref.read(reviewFormProvider.notifier).isStarValidate) {
      scrollToWidget(_starRatingKey);
      showToast('별점을 1개 이상 주세요!');
      return;
    }

    if (!ref.read(reviewFormProvider.notifier).isTagsValidate) {
      scrollToWidget(_tagsKey);
      showToast('어떤 점이 좋았는지 최소 하나를 선택해 주세요!');
      return;
    }

    List<String> stringTags = [];
    ref.watch(reviewFormProvider).tags.forEach((element) {
      stringTags.add(element.toString());
    });

    try {
      await ref.watch(reviewClientProvider).createReview(
          storeNo: ref.watch(storeDetailProvider).storeNo,
          userNo: SharedPreferenceUtil().userNo,
          content: ref.watch(reviewFormProvider).content,
          star: ref.watch(reviewFormProvider).star,
          tags: stringTags,
          imgs: ref.watch(reviewFormProvider).imgs);
    } catch (err, st) {
      print(err);
      print(st);
    }

    setState(() {
      _isFormValid = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _commentController.addListener(_setComment);
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            StarRatingArea(
              key: _starRatingKey,
            ),
            TagSelectionArea(
              key: _tagsKey,
            ),
            const SizedBox(
              height: 80,
            ),
            const AddPhoto(),
            const SizedBox(
              height: 80,
            ),
            CommentTextField(
              controller: _commentController,
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.pink40,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _submit();
                    if (_isFormValid) {
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text(
                  '등록 하기',
                  style: TextStyles.bold14.merge(
                    const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
