import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:timeago/timeago.dart' as timeago;

class PeamanFeedItemHeader extends ConsumerStatefulWidget {
  const PeamanFeedItemHeader({
    super.key,
    required this.feed,
  });

  final PeamanFeed feed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PeamanFeedItemHeaderState();
}

class _PeamanFeedItemHeaderState extends ConsumerState<PeamanFeedItemHeader> {
  @override
  Widget build(BuildContext context) {
    final feedOwnerFuture = ref.watch(
      providerOfSingleUserByIdFuture(widget.feed.ownerId!),
    );
    return feedOwnerFuture.maybeWhen(
      data: (data) => data.when(
        (success) => _dataBuilder(
          photo: success.photo ?? '',
          name: success.name ?? 'Unknown',
          userName: success.userName ?? '',
        ),
        (failure) => _dataBuilder(
          photo: '',
          name: '',
          userName: '',
        ),
      ),
      orElse: () => _dataBuilder(
        photo: '',
        name: '',
        userName: '',
      ),
    );
  }

  Widget _dataBuilder({
    required final String photo,
    required final String name,
    required final String userName,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              PeamanAvatarBuilder.network(photo),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PeamanText.body1(
                        '$name ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PeamanText.body1(
                        '@$userName',
                        style: const TextStyle(
                          color: PeamanColors.grey,
                        ),
                      ),
                    ],
                  ),
                  PeamanText.body2(
                    timeago.format(
                      DateTime.fromMillisecondsSinceEpoch(
                        widget.feed.createdAt!,
                      ),
                    ),
                    style: const TextStyle(
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
          splashRadius: 22.r,
          icon: const Icon(
            Icons.more_horiz_rounded,
          ),
        ),
      ],
    );
  }
}
