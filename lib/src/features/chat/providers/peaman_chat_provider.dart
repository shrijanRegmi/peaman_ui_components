import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';
import 'package:peaman_ui_components/src/features/chat/providers/states/peaman_chat_provider_state.dart';
import 'package:peaman_ui_components/src/features/shared/providers/main_providers.dart';

final providerOfPeamanChat =
    StateNotifierProvider<PeamanChatProvider, PeamanChatProviderState>(
  PeamanChatProvider.new,
);

class PeamanChatProvider extends StateNotifier<PeamanChatProviderState> {
  PeamanChatProvider(final Ref ref)
      : _ref = ref,
        super(const PeamanChatProviderState());

  final Ref _ref;
  PeamanChatRepository get _chatRepository =>
      _ref.watch(providerOfPeamanChatRepository);

  Future<void> sendMessage() async {}
}
