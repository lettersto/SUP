import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final _imageNo = 19377;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.1;
    const imageQueryParams = PaginationQueryParams(size: 10);

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

    final state = ref.watch(widget.provider);

    if (state is CursorPaginationLoading) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state is CursorPaginationError) {
      return SliverToBoxAdapter(
        child: Container(),
      );
    }

    final cp = state as CursorPagination<ImageReviewItemModel>;

    return SliverToBoxAdapter(
      child: Container(
        // color: AppColors.grayTransparent,
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(color: AppColors.grayTransparent),
          top: BorderSide(color: AppColors.grayTransparent),
        )),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 0, 0, 16.0),
              child: Headline(title: '사진 리뷰'),
            ),
            SizedBox(
              height: height,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: cp.list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB((index == 0 ? 16.0 : 0), 0,
                        (index == cp.list.length - 1 ? 16.0 : 4.0), 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PhotoDetailPage(
                              imageNo: _imageNo,
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
          ],
        ),
      ),
    );
  }
}
