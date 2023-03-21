import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/review/like_param.dart';
import '../../../providers/review/review_provider.dart';
import '../../../utils/sharedPreference_util.dart';
import '../../../utils/enums.dart';
import '../../../utils/styles.dart';
import '../../common/headline.dart';
import '../filter_buttons/review_text_button.dart';

class ReviewListTop extends ConsumerStatefulWidget {
  final String nickname;
  final double? starAvg;
  final int? reviewCnt;
  final int? reviewNo;
  final ReviewMode mode;
  final bool? isLike;
  final int? star;
  final int? reviewItemIdx;
  final int? likeCnt;

  const ReviewListTop({
    Key? key,
    required this.mode,
    required this.nickname,
    this.reviewNo,
    this.starAvg,
    this.reviewCnt,
    this.isLike,
    this.reviewItemIdx,
    this.star,
    this.likeCnt,
  }) : super(key: key);

  @override
  ConsumerState<ReviewListTop> createState() => _ReviewListTopState();
}

class _ReviewListTopState extends ConsumerState<ReviewListTop> {
  late bool _isHelpful;
  late int _likeCnt;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isHelpful = widget.isLike ?? false;
    _likeCnt = widget.likeCnt ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final titleColor = (widget.mode == ReviewMode.detail ||
            widget.mode == ReviewMode.photoOnly)
        ? AppColors.white
        : AppColors.black;
    final subTitleColor = (widget.mode == ReviewMode.detail ||
            widget.mode == ReviewMode.photoOnly)
        ? AppColors.white
        : AppColors.gray;
    final paddingVertical = (widget.mode == ReviewMode.detail ||
            widget.mode == ReviewMode.photoOnly)
        ? 8.0
        : 16.0;

    Future<void> markHelpful() async {
      if (widget.reviewNo == null || _isLoading) return;

      setState(() {
        _isHelpful = true;
        _likeCnt += 1;
        _isLoading = true;
      });

      try {
        await ref.watch(reviewClientProvider).markLike(LikeParam(
            userNo: SharedPreferenceUtil().userNo, reviewNo: widget.reviewNo!));
      } catch (err) {
        setState(() {
          _isHelpful = false;
          _likeCnt -= 1;
        });
      } finally {
        _isLoading = false;
      }
    }

    Future<void> removeHelpful() async {
      if (widget.reviewNo == null || _isLoading) return;

      setState(() {
        _isHelpful = false;
        _likeCnt -= 1;
        _isLoading = true;
      });

      try {
        await ref.watch(reviewClientProvider).removeLike(
            userNo: SharedPreferenceUtil().userNo, reviewNo: widget.reviewNo!);
      } catch (err) {
        setState(() {
          _isHelpful = false;
          _likeCnt -= 1;
        });
      } finally {
        _isLoading = false;
      }
    }

    return Container(
      margin: EdgeInsets.only(top: paddingVertical),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Headline(
                    title: widget.nickname,
                    textColor: titleColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  if (widget.mode == ReviewMode.main)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: AppColors.pink40,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.star.toString(),
                          style: TextStyles.medium14
                              .merge(const TextStyle(color: AppColors.pink40)),
                        )
                      ],
                    )
                ],
              ),
              if (widget.reviewCnt != null && widget.starAvg != null)
                Text(
                  '리뷰 ${widget.reviewCnt} / 평균 별점 ${widget.starAvg}',
                  style: TextStyles.medium12.merge(
                    TextStyle(
                      color: subTitleColor,
                    ),
                  ),
                )
            ],
          ),
          if (widget.mode == ReviewMode.main)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ReviewTextButton(
                  text: '도움 돼요!',
                  tapHandler: _isHelpful ? removeHelpful : markHelpful,
                  textColor: _isHelpful ? AppColors.pink60 : AppColors.gray,
                ),
                Text(
                  _likeCnt.toString(),
                  style: const TextStyle(color: AppColors.pink60),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
