import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/pagination_params.dart';
import '../../providers/providers_exporter.dart';
import '../../providers/review/review_provider.dart';
import '../../providers/store/store_detail_provider.dart';
import '../../utils/pagination_utils.dart';
import '../../utils/sharedPreference_util.dart';
import '../common/pagination_sliver_list_view.dart';
import './review_list/review_list_item.dart';
import './review_appbar.dart';
import './review_header.dart';
import './image_review_list.dart';
import './tag_chart/tag_chart.dart';

class ReviewPage extends ConsumerStatefulWidget {
  const ReviewPage(this.storeNo, {super.key});

  final int storeNo;

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  final ScrollController _controller = ScrollController();
  late Params _params;
  late Params _imageParams;

  void listener() {
    PaginationUtils.paginate(
      controller: _controller,
      provider: ref.read(
        paginatedReviewProvider(_params).notifier,
      ),
      paginationQueryParams: _params.paginationQueryParams,
    );
  }

  Future<void> _refreshHandler() async {
    ref.read(reviewChartProvider.notifier).build();
    PaginationUtils.pullToRefresh(
      controller: _controller,
      provider: ref.read(
        paginatedReviewProvider(_params).notifier,
      ),
      paginationQueryParams: _params.paginationQueryParams,
    );
    PaginationUtils.pullToRefresh(
      controller: _controller,
      provider: ref.read(
        paginatedImageReviewProvider(_imageParams).notifier,
      ),
      paginationQueryParams: _imageParams.paginationQueryParams,
    );
  }

  @override
  void initState() {
    super.initState();
    ref
        .read(reviewTotalCountProvider.notifier)
        .getTotalReviewCount(widget.storeNo);
    _controller.addListener(listener);
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storeNo = widget.storeNo;
    ref.watch(reviewFilterStarRegDtmProvider);
    final isOnlyPhotosSelected = ref.watch(reviewFilterOnlyPhotoProvider);
    int selectedTag = ref.watch(reviewTagFilterProvider).selected;
    if (selectedTag == -1) {
      selectedTag = 0;
    } else {
      selectedTag += 3;
    }
    final sort =
        ref.read(reviewFilterStarRegDtmProvider.notifier).getTypeAsString();
    final keyword = ref.watch(reviewSearchKeywordProvider);
    final storeName = ref.watch(storeDetailProvider).storeName ?? '';

    _params = Params(
        paginationPathParams: PaginationPathParams(
            storeNo: storeNo, userNo: SharedPreferenceUtil().userNo),
        paginationQueryParams: PaginationQueryParams(
            size: 10,
            tagNo: selectedTag,
            keyword: keyword,
            sort: sort,
            imgOnly: isOnlyPhotosSelected));

    _imageParams = Params(
      paginationQueryParams: const PaginationQueryParams(size: 10),
      paginationPathParams: PaginationPathParams(storeNo: storeNo),
    );

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshHandler,
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              ReviewAppBar(storeName: storeName),
              const ReviewHeader(),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: ImageReviewList(
                  provider: paginatedImageReviewProvider(_imageParams),
                ),
              ),
              TagChart(
                storeNo: storeNo,
              ),
              PaginationSliverListView(
                provider: paginatedReviewProvider(_params),
                itemBuilder: <ReviewDetailWithPhotos>(_, index, model) {
                  return ReviewListItem(
                    review: model,
                    reviewItemIdx: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
