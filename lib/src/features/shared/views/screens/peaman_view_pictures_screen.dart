import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PeamanViewPicturesArgs {
  final List<String> pictures;
  final int activeIndex;
  final bool downloadable;

  PeamanViewPicturesArgs({
    required this.pictures,
    this.activeIndex = 0,
    this.downloadable = true,
  });
}

class PeamanViewPicturesScreen extends StatefulWidget {
  final List<String> pictures;
  final int activeIndex;
  final bool downloadable;
  const PeamanViewPicturesScreen({
    Key? key,
    required this.pictures,
    this.activeIndex = 0,
    this.downloadable = true,
  }) : super(key: key);

  @override
  State<PeamanViewPicturesScreen> createState() => _ViewPictureScreenState();
}

class _ViewPictureScreenState extends State<PeamanViewPicturesScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late PageController _pageController;
  bool _visible = false;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _activeIndex = widget.activeIndex;
    _pageController = PageController(
      initialPage: widget.activeIndex,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
      ),
    );

    Future.delayed(const Duration(milliseconds: 3000), () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PeamanColors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _visible = true;
            });

            Future.delayed(const Duration(milliseconds: 5000), () {
              setState(() {
                _visible = false;
              });
              _animationController.forward(from: 0.0);
            });
          },
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: Stack(
              children: [
                PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  pageController: _pageController,
                  builder: (context, index) {
                    final picture = widget.pictures[index];

                    return PhotoViewGalleryPageOptions(
                      imageProvider: CachedNetworkImageProvider(
                        picture,
                      ),
                      initialScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered,
                      minScale: PhotoViewComputedScale.contained,
                      heroAttributes: PhotoViewHeroAttributes(tag: picture),
                    );
                  },
                  itemCount: widget.pictures.length,
                  loadingBuilder: (context, event) {
                    return const PeamanSpinner(
                      color: PeamanColors.white,
                    );
                  },
                  onPageChanged: (val) => setState(() {
                    _activeIndex = val;
                  }),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 0.0,
                  right: 0.0,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _visible ? 1.0 : _animation.value,
                          child: PeamanRoundIconButton(
                            onPressed: () async {
                              try {
                                Fluttertoast.showToast(
                                  msg: 'Downloading image...',
                                );
                                final imgId =
                                    await ImageDownloader.downloadImage(
                                  widget.pictures[_activeIndex],
                                );
                                if (imgId == null) {
                                  throw Exception('imageId was null');
                                }
                                Fluttertoast.showToast(
                                  msg: 'Image downloaded!',
                                );
                              } catch (e) {
                                debugPrint(e.toString());
                                Fluttertoast.showToast(
                                  msg:
                                      'An unexpected error occured! Please try again later',
                                );
                              }
                            },
                            bgColor: PeamanColors.white.withOpacity(0.6),
                            icon: const Icon(
                              Icons.download_rounded,
                              color: PeamanColors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 20.0,
                  left: 20.0,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _visible ? 1.0 : _animation.value,
                          child: PeamanRoundIconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            bgColor: Colors.white.withOpacity(0.6),
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: PeamanColors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
