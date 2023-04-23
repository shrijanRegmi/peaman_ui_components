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
  PeamanLocalNotificationProvider get _localNotificationProvider =>
      _ref.watch(providerOfPeamanLocalNotification.notifier);

  void initializeValues({
    required final PeamanFeed? feed,
  }) {
    if (feed == null) return;

    final selectedMedias = feed.files
        .map(
          (e) => PeamanFileUrlExtended(
            url: e.url!,
            thumbnailUrl: e.thumbnailUrl!,
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

  Future<void> createFeed({
    final bool withNotification = true,
    final String? startedUploadingPostNotificationTitle,
    final String? startedUploadingPostNotificationBody,
    final String? uploadingFilesNotificationTitle,
    final String? uploadingFilesNotificationBody,
    final String? completedUploadingPostNotificationTitle,
    final String? completedUploadingPostNotificationBody,
  }) async {
    if (withNotification &&
        startedUploadingPostNotificationTitle != '' &&
        startedUploadingPostNotificationBody != '') {
      _localNotificationProvider.showAlertNotification(
        id: 1,
        title: startedUploadingPostNotificationTitle ??
            (state.feedToEdit != null ? 'Updating post' : 'Uploading post'),
        body: startedUploadingPostNotificationBody ??
            'Your post is being uploaded',
      );
    }

    state = state.copyWith(
      hasStartedCreatingFeed: true,
    );
    if (state.feedType == PeamanFeedType.text ||
        state.feedType == PeamanFeedType.file) {
      await _createMediaFeed(
        withNotification: withNotification,
        uploadingFilesNotificationTitle: uploadingFilesNotificationTitle,
        uploadingFilesNotificationBody: uploadingFilesNotificationBody,
      );
    } else if (state.feedType == PeamanFeedType.poll) {
      await _createPollFeed();
    } else if (state.feedType == PeamanFeedType.youTube) {
      await _createYoutubeFeed();
    }
    if (mounted) {
      state = state.copyWith(
        hasStartedCreatingFeed: false,
      );
    }

    if (withNotification &&
        completedUploadingPostNotificationTitle != '' &&
        completedUploadingPostNotificationBody != '') {
      _ref.read(providerOfPeamanFeed).createFeedState.maybeWhen(
            success: (s) {
              _localNotificationProvider.showAlertNotification(
                id: 1,
                title: completedUploadingPostNotificationTitle ??
                    'Upload complete',
                body: completedUploadingPostNotificationBody ??
                    'Your post has been uploaded',
              );
            },
            error: (e) {
              _localNotificationProvider.showAlertNotification(
                id: 1,
                title: 'Upload failed!',
                body: e.message,
              );
            },
            orElse: () {},
          );
      _ref.read(providerOfPeamanFeed).updateFeedState.maybeWhen(
            success: (s) {
              _localNotificationProvider.showAlertNotification(
                id: 1,
                title: completedUploadingPostNotificationTitle ??
                    'Update complete',
                body: completedUploadingPostNotificationBody ??
                    'Your post has been updated',
              );
            },
            error: (e) {
              _localNotificationProvider.showAlertNotification(
                id: 1,
                title: 'Update failed!',
                body: e.message,
              );
            },
            orElse: () {},
          );
    }
  }

  Future<void> _createMediaFeed({
    final bool withNotification = true,
    final String? uploadingFilesNotificationTitle,
    final String? uploadingFilesNotificationBody,
  }) async {
    if (state.captionController.text.trim().isEmpty && state.files.isEmpty) {
      return;
    }

    final feedId = PeamanReferenceHelper().uniqueId;

    final uploadPath = 'users/${state.feedOwner?.uid}/feeds/$feedId';

    final localFiles = state.files.where((element) => element.isLocal).toList();
    final networkFiles =
        state.files.where((element) => !element.isLocal).toList();

    final fileUrls = <PeamanFileUrl>[];
    for (var i = 0; i < localFiles.length; i++) {
      final file = File(localFiles[i].url);

      final url = await _storageRepository.uploadFile(
        path: uploadPath,
        file: file,
        onProgress: (p) {
          if (withNotification) {
            _localNotificationProvider.showAlertNotification(
              id: 1,
              title: uploadingFilesNotificationTitle ??
                  (state.feedToEdit != null
                      ? 'Updating post'
                      : 'Uploading post'),
              body: uploadingFilesNotificationBody ??
                  '${i + 1}/${localFiles.length}',
              showProgress: true,
              progress: (p * 100).toInt(),
              maxProgress: 100,
            );
          }
        },
      );

      PeamanEither<String, PeamanError>? thumbnailUrlFuture;
      if (localFiles[i].type == PeamanFileType.video &&
          localFiles[i].thumbnailUrl != null) {
        final thumbnailFile = File(localFiles[i].thumbnailUrl!);
        thumbnailUrlFuture = await _storageRepository.uploadFile(
          path: uploadPath,
          file: thumbnailFile,
          onProgress: (p) {},
        );
      }

      url.when(
        (url) {
          if (thumbnailUrlFuture == null) {
            final fileUrl = PeamanFileUrl(
              url: url,
              type: localFiles[i].type == PeamanFileType.image
                  ? PeamanFileType.image
                  : PeamanFileType.video,
            );
            fileUrls.add(fileUrl);
          } else {
            thumbnailUrlFuture.when(
              (thumbnailUrl) {
                final fileUrl = PeamanFileUrl(
                  url: url,
                  thumbnailUrl: thumbnailUrl,
                  type: localFiles[i].type == PeamanFileType.image
                      ? PeamanFileType.image
                      : PeamanFileType.video,
                );
                fileUrls.add(fileUrl);
              },
              (failure) => null,
            );
          }
        },
        (failure) => null,
      );
    }

    final newFiles = [...networkFiles, ...fileUrls];

    final feed = PeamanFeed(
      id: state.feedToEdit?.id ?? feedId,
      ownerId: state.feedOwner?.uid,
      caption: state.captionController.text.trim(),
      files: newFiles,
      searchKeys: _getSearchKeys(),
      type: newFiles.isEmpty ? PeamanFeedType.text : PeamanFeedType.file,
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

    if (localFiles.isEmpty) {
      await Future.delayed(const Duration(milliseconds: 2000));
    }
  }

  Future<void> _createPollFeed() async {
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

    await Future.delayed(const Duration(milliseconds: 2000));
  }

  Future<void> _createYoutubeFeed() async {
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

    await Future.delayed(const Duration(milliseconds: 2000));
  }

  Future<void> _pickImages() async {
    final pickedImages = await ImagePicker().pickMultiImage();
    for (final pickedImage in pickedImages) {
      final file = PeamanFileUrlExtended(
        url: pickedImage.path,
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
