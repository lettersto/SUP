import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/pagination_params.dart';
import '../../providers/review/review_form_provider.dart';
import '../../providers/review/review_provider.dart';
import '../../providers/store/store_detail_provider.dart';
import '../../utils/styles.dart';
import '../../utils/app_utils.dart';
import '../../utils/sharedPreference_util.dart';
import '../../utils/pagination_utils.dart';

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
  late Params _params;
  late Params _imageParams;
  bool _isLoading = false;

  void _setComment() {
    ref
        .read(reviewFormProvider.notifier)
        .setContent(_commentController.text.trim());
  }

  Future _scrollToWidget(GlobalKey key) async {
    final context = key.currentContext;
    await Scrollable.ensureVisible(context!,
        duration: const Duration(milliseconds: 800));
  }

  Future<void> _submitHandler() async {
    if (!_formKey.currentState!.validate() || _isLoading) return;

    if (!ref.read(reviewFormProvider.notifier).isStarValidate) {
      _scrollToWidget(_starRatingKey);
      showToast('별점을 1개 이상 주세요!');
      throw Exception('Invalid Form Format');
    }

    if (!ref.read(reviewFormProvider.notifier).isTagsValidate) {
      _scrollToWidget(_tagsKey);
      showToast('어떤 점이 좋았는지 최소 하나를 선택해 주세요!');
      throw Exception('Invalid Form Format');
    }

    List<String> stringTags = [];
    ref.watch(reviewFormProvider).tags.forEach((element) {
      stringTags.add(element.toString());
    });

    setState(() {
      _isLoading = true;
    });

    try {
      await ref.watch(reviewClientProvider).createReview(
          storeNo: ref.watch(storeDetailProvider).storeNo,
          userNo: SharedPreferenceUtil().userNo,
          content: ref.watch(reviewFormProvider).content,
          star: ref.watch(reviewFormProvider).star,
          tags: stringTags,
          imgs: ref.watch(reviewFormProvider).imgs);
    } on DioError catch (err) {
      throw Exception(err);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _refreshReview() {
    ref.read(reviewChartProvider.notifier).build();
    ref
        .read(reviewTotalCountProvider.notifier)
        .getTotalReviewCount(ref.watch(storeDetailProvider).storeNo);
    PaginationUtils.pullToRefresh(
      provider: ref.read(
        paginatedReviewProvider(_params).notifier,
      ),
      paginationQueryParams: _params.paginationQueryParams,
    );
    PaginationUtils.pullToRefresh(
      provider: ref.read(
        paginatedImageReviewProvider(_imageParams).notifier,
      ),
      paginationQueryParams: _imageParams.paginationQueryParams,
    );
  }

  void _pressHandler() async {
    if (_formKey.currentState!.validate()) {
      await _submitHandler().then((value) {
        _refreshReview();
        Navigator.pop(context);
      });
    }
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
    _params = ref.watch(paginatedReviewParamsProvider);
    _imageParams = ref.watch(paginatedImageParamsProvider);

    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Form(
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
                    onPressed: _isLoading ? null : _pressHandler,
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
          if (_isLoading) const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
