import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/dummy/dummy_providers.dart';
import '../../utils/styles.dart';

import './form_field/star_rating/star_rating_area.dart';
import './form_field/tag_selection/tag_selection_area.dart';
import './form_field/comment_text_field.dart';
import './form_field/add_photo.dart';

class ReviewForm extends ConsumerStatefulWidget {
  const ReviewForm({super.key});

  @override
  ConsumerState<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends ConsumerState<ReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();

  void _setComment() {
    ref
        .read(reviewFormFieldProvider.notifier)
        .setContent(_commentController.text);
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
            const StarRatingArea(),
            const TagSelectionArea(),
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
                    print('invalidate!');
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
