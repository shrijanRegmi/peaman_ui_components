import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanFeed =
    StateNotifierProvider<PeamanFeedProvider, PeamanFeedProviderState>((ref) {
  return PeamanFeedProvider(ref);
});

final providerOfPeamanFeedsFuture =
    FutureProvider<PeamanEither<List<PeamanFeed>, PeamanError>>((ref) async {
  return ref.watch(providerOfPeamanFeedRepository).getFeeds();
});

final providerOfPeamanSingleFeedByIdFuture =
    FutureProvider.family<PeamanEither<PeamanFeed, PeamanError>, String>(
        (ref, feedId) async {
  return ref.watch(providerOfPeamanFeedRepository).getSingleFeed(
        feedId: feedId,
      );
});

class PeamanFeedProvider extends StateNotifier<PeamanFeedProviderState> {
  PeamanFeedProvider(final Ref ref)
      : _ref = ref,
        super(const PeamanFeedProviderState());

  final Ref _ref;

  PeamanFeedRepository get _feedRepository =>
      _ref.watch(providerOfPeamanFeedRepository);
  PeamanInfoProvider get _logProvider =>
      _ref.read(providerOfPeamanInfo.notifier);

  Future<void> createFeed({
    final String? successLogMessage,
  }) async {
    const feed = PeamanFeed();

    state = state.copyWith(
      createFeedState: const CreateFeedState.loading(),
    );
    final result = await _feedRepository.createFeed(
      feed: feed,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          createFeedState: CreateFeedState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          createFeedState: CreateFeedState.error(failure),
        );
      },
    );
  }

  Future<void> updateFeed({
    required final String feedId,
    required final List<PeamanField> fields,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      updateFeedState: const UpdateFeedState.loading(),
    );
    final result = await _feedRepository.updateFeed(
      feedId: feedId,
      fields: fields,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          updateFeedState: UpdateFeedState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          updateFeedState: UpdateFeedState.error(failure),
        );
      },
    );
  }

  Future<void> deleteFeed({
    required final String feedId,
    required final String ownerId,
    final String? successLogMessage,
  }) async {
    state = state.copyWith(
      deleteFeedState: const DeleteFeedState.loading(),
    );
    final result = await _feedRepository.deleteFeed(
      feedId: feedId,
      ownerId: ownerId,
    );
    result.when(
      (success) {
        if (successLogMessage != null) {
          _logProvider.logSuccess(successLogMessage);
        }
        state = state.copyWith(
          deleteFeedState: DeleteFeedState.success(success),
        );
      },
      (failure) {
        _logProvider.logError(failure.message);
        state = state.copyWith(
          deleteFeedState: DeleteFeedState.error(failure),
        );
      },
    );
  }
}
