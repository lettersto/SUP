import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sup/ui/review/common/no_content_indicator.dart';

import '../../models/common/cursor_pagination_model.dart';
import '../../models/common/pagination_params.dart';
import '../../models/review/image_review.dart';
import '../../providers/common/pagination_provider.dart';
import '../../utils/pagination_utils.dart';
import '../../utils/styles.dart';
import '../../ui/photo_detail/photo_detail_page.dart';
import '../../ui/common/headline.dart';

class ImageReviewList extends ConsumerStatefulWidget {
  final StateNotifierProvider<PaginationProvider, CursorPaginationBase>
      provider;

  const ImageReviewList({
    super.key,
    required this.provider,
  });

  @override
  ConsumerState<ImageReviewList> createState() => _ImageReviewListState();
}

class _ImageReviewListState extends ConsumerState<ImageReviewList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    const imageQueryParams = PaginationQueryParams(size: 10);
    final height = MediaQuery.of(context).size.height * 0.1;
    final width = MediaQuery.of(context).size.width;
    final widths = [
      width * 0.2,
      width * 0.25,
      width * 0.2,
      width * 0.25,
      width * 0.2
    ];

    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.width * 0.2;
      if (maxScroll - currentScroll <= delta) {
        PaginationUtils.paginate(
          controller: _scrollController,
          provider: ref.read(
            widget.provider.notifier,
          ),
          paginationQueryParams: imageQueryParams,
        );
      }
    });

    Widget renderImageReviewContainer({required Widget child}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Headline(title: '사진 리뷰'),
              ),
            ),
            SizedBox(
              height: height,
              child: child,
            )
          ],
        ),
      );
    }

    final state = ref.watch(widget.provider);

    if (state is CursorPaginationLoading) {
      return SliverToBoxAdapter(
        child: renderImageReviewContainer(
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: widths
                .map((w) => (Container(
                      height: height,
                      width: w,
                      margin: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
                      decoration: BoxDecoration(
                          color: AppColors.grayTransparent2,
                          borderRadius: BorderRadius.circular(4.0)),
                    )))
                .toList(),
          ),
        ),
      );
    }

    if (state is CursorPaginationError) {
      return SliverToBoxAdapter(
        child: renderImageReviewContainer(
          child: NoContentIndicator(height: height, message: '사진이 없어요! 😔'),
        ),
      );
    }

    final cp = state as CursorPagination<ImageReviewItemModel>;

    return SliverToBoxAdapter(
      child: renderImageReviewContainer(
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: cp.list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 0, (index == cp.list.length - 1 ? 16.0 : 4.0), 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PhotoDetailPage(
                        imageNo: cp.list[index].id,
                      ),
                    ));
                  },
                  child: Image.network(
                    cp.list[index].imgUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: height,
                        width: height,
                        color: AppColors.grayTransparent2,
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
