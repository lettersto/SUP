import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/common/pagination_params.dart';
import '../../providers/review/review_provider.dart';
import '../../utils/pagination_utils.dart';
import '../common/pagination_sliver_list_view.dart';
import './review_list/review_list_item.dart';
import './review_appbar.dart';
import './review_header.dart';
import './image_review_list.dart';
import './tag_chart/tag_chart.dart';

class ReviewPage extends ConsumerStatefulWidget {
  const ReviewPage({super.key});

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  final ScrollController _controller = ScrollController();
  // TODO 어떤 식당과 유저에게서 넘겨오는 지에 따라 아래 storeNo와 userNo 변경
  final params = ReviewDetailParams(storeNo: 1, userNo: 1);

  void listener() {
    PaginationUtils.paginate(
      controller: _controller,
      provider: ref.read(
        paginatedReviewProvider(params).notifier,
      ),
    );
  }

  Future<void> _refreshHandler() async {
    PaginationUtils.pullToRefresh(
        controller: _controller,
        provider: ref.read(
          paginatedReviewProvider(params).notifier,
        ));
  }

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshHandler,
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              const ReviewAppBar(storeName: '가게 이름'),
              const ReviewHeader(),
              const SliverToBoxAdapter(child: ImageReviewList()),
              const TagChart(),
              PaginationSliverListView(
                provider: paginatedReviewProvider(params),
                itemBuilder: <ReviewDetailWithPhotos>(_, index, model) {
                  return ReviewListItem(
                    review: model,
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
