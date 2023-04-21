import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

final providerOfPeamanCreateFeed = StateNotifierProvider<
    PeamanCreateFeedProvider, PeamanCreateFeedProviderState>((ref) {
  return PeamanCreateFeedProvider(ref);
});

class PeamanCreateFeedProvider
    extends StateNotifier<PeamanCreateFeedProviderState> {
  PeamanCreateFeedProvider(Ref ref)
      : _ref = ref,
        super(
          PeamanCreateFeedProviderState(
            captionController: PeamanStyleableTextEditingController(
              styles: TextPartStyleDefinitions(
                definitionList: <PeamanTextPartStyleDefinition>[
                  PeamanTextPartStyleDefinition(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    pattern: "@[0-9a-z]([0-9a-z_])*",
                  ),
                  PeamanTextPartStyleDefinition(
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    pattern: "#[0-9a-z]([0-9a-z_])*",
                  ),
                ],
              ),
            ),
            pollQuestionController: TextEditingController(),
            youtubeLinkController: TextEditingController(),
            pollOptions: [
              PeamanPollOption(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
              ),
              PeamanPollOption(
                id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
              ),
            ],
          ),
        );

  final Ref _ref;
  PeamanStorageRepository get _storageRepository =>
      _ref.watch(providerOfPeamanStorageRepository);
  PeamanFeedProvider get _feedProvider =>
      _ref.watch(providerOfPeamanFeed.notifier);

  void initializeValues({
    required final PeamanFeed? feed,
  }) {
    if (feed == null) return;

    final selectedMedias = feed.files
        .map(
          (e) => PeamanFileUrlExtended(
            url: e.url!,
            thumbnailUrl: e.url!,
            type: e.type,
            isLocal: false,
          ),
        )
        .toList();
    final caption = feed.caption ?? '';
    final feedType = feed.type;
    final pollQuestion = feed.pollQuestion ?? '';
    final pollOptions = feed.pollOptions;

    state = state.copyWith(
      feedToEdit: feed,
      files: selectedMedias,
      captionController: TextEditingController()..text = caption,
      feedType: feedType,
      pollQuestionController: TextEditingController()..text = pollQuestion,
      pollOptions: pollOptions,
    );
  }

  void onPressedImageSelector() {
    setFeedType(PeamanFeedType.file);
    _pickImages();
  }

  void onPressedVideoSelector() {
    setFeedType(PeamanFeedType.file);
    _pickVideo();
  }

  void onPressedYouTubeSelector() {
    if (state.feedType == PeamanFeedType.youTube) {
      setFeedType(PeamanFeedType.file);
    } else {
      setFeedType(PeamanFeedType.youTube);
    }
  }

  void onPressedPollsSelector() {
    if (state.feedType == PeamanFeedType.poll) {
      setFeedType(PeamanFeedType.file);
    } else {
      setFeedType(PeamanFeedType.poll);
    }
  }

  void onPressedEditMedia(final PeamanFileUrlExtended file) async {
    final index = state.files.indexWhere((e) => e.url == file.url);
    if (index != -1) {
      final files = List<PeamanFileUrlExtended>.from(state.files);

      if (file.type == PeamanFileType.image) {
        final newMedia = await _pickCorrectedImage();
        if (newMedia != null) {
          files[index] = newMedia;
          state = state.copyWith(
            files: files,
          );
        }
      } else {
        final newMedia = await _pickCorrectedVideo();
        if (newMedia != null) {
          files[index] = newMedia;
          state = state.copyWith(
            files: files,
          );
        }
      }
    }
  }

  void createFeed() {
    if (state.feedType == PeamanFeedType.text ||
        state.feedType == PeamanFeedType.file) {
      _createMediaFeed();
    } else if (state.feedType == PeamanFeedType.poll) {
      _createPollFeed();
    } else if (state.feedType == PeamanFeedType.youTube) {
      _createYoutubeFeed();
    }
  }

  void _createMediaFeed() async {
    if (state.captionController.text.trim().isEmpty && state.files.isEmpty) {
      return;
    }

    final feedId = PeamanReferenceHelper().uniqueId;
    final millis = DateTime.now().millisecondsSinceEpoch;

    final uploadPath =
        'users/${state.feedOwner?.uid}/feeds/$feedId/medias/$millis';

    final fileUrls = <PeamanFileUrl>[];
    for (var i = 0; i < state.files.length; i++) {
      final file = File(state.files[i].url);

      final url = await _storageRepository.uploadFile(
        path: '${uploadPath}_$i.jpg',
        file: file,
        onProgress: (p) {},
      );

      url.when(
        (success) {
          final fileUrl = PeamanFileUrl(
            url: success,
            type: state.files[i].type == PeamanFileType.image
                ? PeamanFileType.image
                : PeamanFileType.video,
          );
          fileUrls.add(fileUrl);
        },
        (failure) => null,
      );
    }

    final feed = PeamanFeed(
      id: state.feedToEdit?.id ?? feedId,
      ownerId: state.feedOwner?.uid,
      caption: state.captionController.text.trim(),
      files: fileUrls,
      searchKeys: _getSearchKeys(),
      type: fileUrls.isEmpty ? PeamanFeedType.text : PeamanFeedType.file,
    );

    if (state.feedToEdit != null) {
      await _feedProvider.updateFeed(
        feedId: feed.id!,
        fields: [
          PeamanField(
            key: 'ownerId',
            value: feed.ownerId,
          ),
          PeamanField(
            key: 'caption',
            value: feed.caption,
          ),
          PeamanField(
            key: 'files',
            value: feed.files.map((e) => e.toJson()).toList(),
          ),
          PeamanField(
            key: 'searchKeys',
            value: feed.searchKeys,
          ),
          PeamanField(
            key: 'type',
            value: ksPeamanFeedTypeExt[feed.type],
          ),
        ],
      );
    } else {
      await _feedProvider.createFeed(
        feed: feed,
      );
    }
  }

  void _createPollFeed() async {
    final pollOptions = state.pollOptions
        .where(
          (element) => element.option?.isNotEmpty ?? false,
        )
        .toList();
    if (state.pollQuestionController.text.trim().isEmpty ||
        pollOptions.length < 2) return;

    final feedId = PeamanReferenceHelper().uniqueId;

    final feed = PeamanFeed(
      id: state.feedToEdit?.id ?? feedId,
      ownerId: state.feedOwner?.uid,
      caption: state.captionController.text.trim(),
      pollQuestion: state.pollQuestionController.text.trim(),
      pollOptions: pollOptions,
      searchKeys: _getSearchKeys(),
      type: PeamanFeedType.poll,
    );

    if (state.feedToEdit != null) {
      await _feedProvider.updateFeed(
        feedId: feed.id!,
        fields: [
          PeamanField(
            key: 'ownerId',
            value: feed.ownerId,
          ),
          PeamanField(
            key: 'caption',
            value: feed.caption,
          ),
          PeamanField(
            key: 'searchKeys',
            value: feed.searchKeys,
          ),
          PeamanField(
            key: 'type',
            value: ksPeamanFeedTypeExt[feed.type],
          ),
          PeamanField(
            key: 'pollQuestion',
            value: feed.pollQuestion,
          ),
          PeamanField(
            key: 'pollOptions',
            value: feed.pollOptions.map((e) => e.toJson()).toList(),
          ),
        ],
      );
    } else {
      await _feedProvider.createFeed(
        feed: feed,
      );
    }
  }

  void _createYoutubeFeed() async {
    if (!state.isYoutubeLinkValid) return;

    final feedId = PeamanReferenceHelper().uniqueId;

    final feed = PeamanFeed(
      id: state.feedToEdit?.id ?? feedId,
      ownerId: state.feedOwner?.uid,
      caption: state.captionController.text.trim(),
      ytLink: state.youtubeLinkController.text.trim(),
      searchKeys: _getSearchKeys(),
      type: PeamanFeedType.youTube,
    );

    if (state.feedToEdit != null) {
      await _feedProvider.updateFeed(
        feedId: feed.id!,
        fields: [
          PeamanField(
            key: 'ownerId',
            value: feed.ownerId,
          ),
          PeamanField(
            key: 'caption',
            value: feed.caption,
          ),
          PeamanField(
            key: 'searchKeys',
            value: feed.searchKeys,
          ),
          PeamanField(
            key: 'type',
            value: ksPeamanFeedTypeExt[feed.type],
          ),
          PeamanField(
            key: 'ytLink',
            value: feed.ytLink,
          ),
        ],
      );
    } else {
      await _feedProvider.createFeed(
        feed: feed,
      );
    }
  }

  Future<void> _pickImages() async {
    final pickedImages = await ImagePicker().pickMultiImage();
    for (final pickedImage in pickedImages) {
      final file = PeamanFileUrlExtended(
        url: pickedImage.path,
        thumbnailUrl: pickedImage.path,
        type: PeamanFileType.image,
        isLocal: true,
      );

      addToFiles(file);
    }
  }

  Future<PeamanFileUrlExtended?> _pickCorrectedImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      final file = PeamanFileUrlExtended(
        url: pickedImage.path,
        thumbnailUrl: pickedImage.path,
        type: PeamanFileType.image,
        isLocal: true,
      );
      return file;
    }
    return null;
  }

  Future<void> _pickVideo() async {
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (pickedVideo != null) {
      final thumbnail = await VideoThumbnail.thumbnailFile(
        video: File(pickedVideo.path).uri.path,
        imageFormat: ImageFormat.WEBP,
      );

      final file = PeamanFileUrlExtended(
        url: pickedVideo.path,
        thumbnailUrl: thumbnail ?? '',
        type: PeamanFileType.video,
        isLocal: true,
      );

      addToFiles(file);
    }
  }

  Future<PeamanFileUrlExtended?> _pickCorrectedVideo() async {
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedVideo != null) {
      final thumbnail = await VideoThumbnail.thumbnailFile(
        video: File(pickedVideo.path).uri.path,
        imageFormat: ImageFormat.WEBP,
      );
      final file = PeamanFileUrlExtended(
        url: pickedVideo.path,
        thumbnailUrl: thumbnail ?? '',
        type: PeamanFileType.video,
        isLocal: true,
      );
      return file;
    }
    return null;
  }

  List<String> _getSearchKeys() {
    var searchKeys = <String>[];
    final longCaption = state.captionController.text.trim();

    final caption =
        longCaption.length > 300 ? longCaption.substring(0, 300) : longCaption;
    final captions = caption.split(' ');

    // split letters of caption
    for (int i = 0; i < caption.length; i++) {
      final letter = caption.substring(0, i + 1);
      if (!searchKeys.contains(letter.toUpperCase())) {
        searchKeys.add(letter.toUpperCase());
      }
    }
    //

    // split letters of captions
    for (int i = 0; i < captions.length; i++) {
      for (int j = 0; j < captions[i].length; j++) {
        final letter = captions[i].substring(0, j + 1);
        if (!searchKeys.contains(letter.toUpperCase())) {
          searchKeys.add(letter.toUpperCase());
        }
      }
    }
    //

    return searchKeys
        .where((element) =>
            element.trim() != '' &&
            element.trim() != ',' &&
            element.trim() != '.')
        .toList();
  }

  void addToFiles(final PeamanFileUrlExtended newVal) {
    state = state.copyWith(
      files: [...state.files, newVal],
    );
  }

  void removeFromFiles(final PeamanFileUrlExtended newVal) {
    state = state.copyWith(
      files: state.files.where((element) => element.url != newVal.url).toList(),
    );
  }

  void setFeedOwner(final PeamanUser newVal) {
    state = state.copyWith(feedOwner: newVal);
  }

  void setFeedType(final PeamanFeedType newVal) {
    state = state.copyWith(feedType: newVal);
  }

  void addToPollOptions(final PeamanPollOption newVal) {
    state = state.copyWith(
      pollOptions: [...state.pollOptions, newVal],
    );
  }

  void removeFromPollOptions(final PeamanPollOption newVal) {
    state = state.copyWith(
      pollOptions: state.pollOptions
          .where((element) => element.id != newVal.id)
          .toList(),
    );
  }

  void addValueToPollOption(final int index, final String newVal) {
    state = state.copyWith(
      pollOptions: List<PeamanPollOption>.from(state.pollOptions)
        ..[index] = state.pollOptions[index].copyWith(
          option: newVal,
        ),
    );
  }

  void removeValueFromPollOption(final int index) {
    state = state.copyWith(
      pollOptions: List<PeamanPollOption>.from(state.pollOptions)
        ..[index] = state.pollOptions[index].copyWith(
          option: '',
        ),
    );
  }
}
