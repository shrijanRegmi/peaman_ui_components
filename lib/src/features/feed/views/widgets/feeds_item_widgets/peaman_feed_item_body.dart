import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedItemBody extends ConsumerStatefulWidget {
  const PeamanFeedItemBody({
    super.key,
    required this.feedId,
  });

  final String feedId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedItemBodyState();
}

class _PeamanFeedItemBodyState extends ConsumerState<PeamanFeedItemBody> {
  final stockImg =
      "https://images.pexels.com/photos/600114/pexels-photo-600114.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

  final stockImg2 =
      "https://images.ctfassets.net/usf1vwtuqyxm/2n8JnRmzLJdYzM4SoIzVLL/3dea9275b3be7b5aef314aeb89d7616a/release_1_hagrids_hut__1_.png?fm=jpg&q=70&w=2560";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _coverImgBuilder(),
        SizedBox(
          height: 5.h,
        ),
        _otherImagesGridBuilder(),
        SizedBox(
          height: 10.h,
        ),
        _captionBuilder(),
      ],
    );
  }

  Widget _coverImgBuilder() {
    return Container(
      width: double.infinity,
      height: 140.h,
      decoration: BoxDecoration(
        color: PeamanColors.extraLightGrey,
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            stockImg,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _otherImagesGridBuilder() {
    const list = 10;
    const filteredList = 6;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5.w,
        crossAxisSpacing: 5.w,
        childAspectRatio: 3 / 2,
      ),
      itemCount: filteredList,
      itemBuilder: (context, index) {
        final isMoreMediaAvailable =
            (list > filteredList && index == (filteredList - 1));
        return Container(
          decoration: BoxDecoration(
            color: PeamanColors.extraLightGrey,
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                stockImg2,
              ),
              fit: BoxFit.cover,
              colorFilter: !isMoreMediaAvailable
                  ? null
                  : ColorFilter.mode(
                      PeamanColors.black87.withOpacity(0.3),
                      BlendMode.darken,
                    ),
            ),
          ),
          child: !isMoreMediaAvailable
              ? null
              : const Center(
                  child: PeamanText.body2(
                    '+${(list - filteredList) + 1}',
                    style: TextStyle(
                      color: PeamanColors.white,
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _captionBuilder() {
    return const PeamanText.body1(
      "Happy birthday to Shraddha. May your 34th year be filled with love, joy and God's blessings",
    );
  }
}
