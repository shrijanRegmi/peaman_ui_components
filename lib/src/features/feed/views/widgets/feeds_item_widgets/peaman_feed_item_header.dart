import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanFeedItemHeader extends ConsumerStatefulWidget {
  const PeamanFeedItemHeader({
    super.key,
    required this.feedId,
  });

  final String feedId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedItemHeaderState();
}

class _PeamanFeedItemHeaderState extends ConsumerState<PeamanFeedItemHeader> {
  final stockImg =
      "https://media.fashionnetwork.com/m/1484/a0b4/dca3/415b/6672/1d02/c3fa/3baa/5c75/7348/7348.jpg";
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              PeamanAvatarBuilder.network(
                stockImg,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      PeamanText.body1(
                        'vioo ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PeamanText.body1(
                        '@violadwip_',
                        style: TextStyle(
                          color: PeamanColors.grey,
                        ),
                      ),
                    ],
                  ),
                  const PeamanText.body2(
                    '3 days ago',
                    style: TextStyle(
                      color: PeamanColors.midLightGrey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz_rounded,
          ),
        ),
      ],
    );
  }
}
