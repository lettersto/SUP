import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/styles.dart';
import '../../models/dummy/dummy.dart';
import '../../providers/dummy/dummy_providers.dart';

import '../../ui/photo_detail/photo_detail_page.dart';
import '../../ui/common/headline.dart';

class ImageReviewList extends ConsumerWidget {
  final _imageNo = 19377;

  const ImageReviewList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height * 0.1;
    final ScrollController scrollController = ScrollController();
    AsyncValue<List<ImageReview>> imageReviews = ref.watch(imageReviewProvider);

    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.width * 0.2;
      if (maxScroll - currentScroll <= delta) {
        print('image review scrolled!!');
      }
    });

    return imageReviews.when(
      data: (data) {
        return Container(
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
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB((index == 0 ? 16.0 : 0), 0,
                          (index == data.length - 1 ? 16.0 : 4.0), 0),
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
                            data[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      // TODO implement error & loading component
      error: (error, stackTrace) => Text(error.toString()),
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
