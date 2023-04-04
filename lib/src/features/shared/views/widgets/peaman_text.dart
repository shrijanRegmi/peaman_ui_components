// ignore_for_file: implementation_imports
import 'package:linkfy_text/src/model/link.dart';
import 'package:flutter/material.dart';
import 'package:linkfy_text/linkfy_text.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PeamanText extends StatefulWidget {
  // for actual text
  final String? value;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextStyle defaultStyle;
  final Function()? onPressed;

  // for linkify
  final bool linkify;
  final Function(Link)? onLinkPressed;

  // for read more
  final bool withReadMore;
  final String readMoreText;
  final TextStyle? readMoreTextStyle;
  final int? limit;
  final double? height;
  final Function(ScrollNotification)? onScroll;
  final Function(bool)? onPressedShowMore;

  PeamanText.heading1(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.heading1,
        super(key: key);

  PeamanText.heading2(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.heading2,
        super(key: key);

  PeamanText.heading3(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.heading3,
        super(key: key);

  PeamanText.heading4(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.heading4,
        super(key: key);

  PeamanText.heading5(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.heading5,
        super(key: key);

  PeamanText.heading6(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.heading6,
        super(key: key);

  PeamanText.subtitle1(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.subtitle1,
        super(key: key);

  PeamanText.subtitle2(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.subtitle2,
        super(key: key);

  PeamanText.body1(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.body1,
        super(key: key);

  PeamanText.body2(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.body2,
        super(key: key);

  PeamanText.button(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.button,
        super(key: key);

  PeamanText.caption(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.caption,
        super(key: key);

  PeamanText.overline(
    this.value, {
    Key? key,
    this.style,
    this.textAlign = TextAlign.start,
    this.limit,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  })  : defaultStyle = PeamanTextStyles.overline,
        super(key: key);

  @override
  State<PeamanText> createState() => _PTextState();
}

class _PTextState extends State<PeamanText> {
  bool _showAll = false;

  @override
  void initState() {
    super.initState();
    _showAll = widget.limit == null;
  }

  @override
  void didUpdateWidget(covariant PeamanText oldWidget) {
    if (oldWidget.limit != widget.limit) {
      setState(() {
        _showAll = widget.limit == null;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value == null) return Container();

    return widget.height != null && _showAll
        ? SizedBox(
            height: widget.height,
            child: NotificationListener<ScrollNotification>(
              onNotification: (val) {
                widget.onScroll?.call(val);
                return true;
              },
              child: SingleChildScrollView(
                child: _textBuilder(),
              ),
            ),
          )
        : _textBuilder();
  }

  Widget _textBuilder() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.onPressed,
          child: LinkifyText(
            _limitedText(),
            textStyle: TextStyle(
              color: context.theme.textTheme.bodyMedium!.color,
            ).merge(
              widget.defaultStyle.merge(widget.style),
            ),
            textAlign: widget.textAlign,
            linkStyle: !widget.linkify
                ? widget.defaultStyle.merge(widget.style)
                : TextStyle(
                    color: context.theme.colorScheme.secondary,
                  ),
            onTap: widget.onLinkPressed ??
                (link) {
                  if (link.value != null && widget.linkify) {
                    final text = link.value!;
                    if (text.startsWith('#')) {
                      _gotoHashtagScreen(
                        context: context,
                        hashtag: text.replaceAll('#', ''),
                      );
                    } else if (text.startsWith('@')) {
                      _gotoFriendProfileScreen(
                        context: context,
                        userName: text.replaceAll('@', ''),
                      );
                    } else if (link.type == LinkType.url) {
                      _gotoBrowser(
                        context: context,
                        link: text,
                      );
                    }
                  }
                },
            linkTypes: const [
              LinkType.url,
              LinkType.email,
              LinkType.hashTag,
              LinkType.userTag,
            ],
          ),
        ),
        if (widget.withReadMore &&
            (widget.value?.length ?? 0) > (widget.limit ?? 0))
          const SizedBox(
            height: 8.0,
          ),
        if (widget.withReadMore &&
            (widget.value?.length ?? 0) > (widget.limit ?? 0))
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _showAll = !_showAll;
              });
              widget.onPressedShowMore?.call(_showAll);
            },
            child: Text(
              _showAll
                  ? '${widget.readMoreText} Less'
                  : '${widget.readMoreText} More',
              style: widget.defaultStyle.merge(widget.style).merge(
                    widget.readMoreTextStyle ??
                        TextStyle(
                          color: context.theme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
            ),
          )
      ],
    );
  }

  String _limitedText() {
    final text = widget.value ?? '';

    if (_showAll) return text;

    if (widget.limit != null) {
      return text.length > widget.limit!
          ? '${text.substring(0, widget.limit).trim()}...'
          : text;
    }
    return text;
  }

  void _gotoHashtagScreen({
    required final BuildContext context,
    required final String hashtag,
  }) {
    // Navigator.pushNamed(
    //   context,
    //   AppRoutes.viewHashtagFeedsScreen,
    //   arguments: ViewHashtagFeedsScreenArgs.byHashtagId(
    //     hashtagId: hashtag,
    //   ),
    // );
  }

  void _gotoFriendProfileScreen({
    required final BuildContext context,
    required final String userName,
  }) {
    // final appUserReadOnly = context.pread<PeamanUser>();
    // if (userName == appUserReadOnly.userName) {
    //   Navigator.pushNamedAndRemoveUntil(
    //     context,
    //     AppRoutes.profileTab,
    //     (route) => false,
    //   );
    //   return;
    // }

    // Navigator.pushNamed(
    //   context,
    //   AppRoutes.friendProfileScreen,
    //   arguments: FriendProfileScreenArgs.byUserName(
    //     userName: userName,
    //   ),
    // );
  }

  void _gotoBrowser({
    required final BuildContext context,
    required final String link,
  }) async {
    try {
      if (await canLaunchUrlString(link)) {
        await launchUrlString(link);
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint('Error!!!: Opening link');
    }
  }
}
