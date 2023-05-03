import 'package:peaman_ui_components/peaman_ui_components.dart';

final providerOfPeamanAuthRepository = Provider<PeamanAuthRepository>((ref) {
  return PeamanAuthRepositoryImpl(
    peamanUserRepository: ref.watch(providerOfPeamanUserRepository),
  );
});

final providerOfPeamanUserRepository = Provider<PeamanUserRepository>((ref) {
  return PeamanUserRepositoryImpl();
});

final providerOfPeamanChatRepository = Provider<PeamanChatRepository>((ref) {
  return PeamanChatRepositoryImpl();
});

final providerOfPeamanFeedRepository = Provider<PeamanFeedRepository>((ref) {
  return PeamanFeedRepositoryImpl(
    peamanUserRepository: ref.watch(providerOfPeamanUserRepository),
  );
});

final providerOfPeamanStorageRepository =
    Provider<PeamanStorageRepository>((ref) {
  return PeamanStorageRepositoryImpl();
});

final providerOfPeamanCloudFunctionRepository =
    Provider<PeamanCloudFunctionRepository>((ref) {
  return PeamanCloudFunctionRepositoryImpl();
});

final providerOfPeamanCloudMessagingRepository =
    Provider<PeamanCloudMessagingRepository>((ref) {
  return PeamanCloudMessagingRepositoryImpl();
});

final providerOfPeamanReportRepository =
    Provider<PeamanReportRepository>((ref) {
  return PeamanReportRepositoryImpl();
});
