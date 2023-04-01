import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerOfPeamanChip =
    StateNotifierProvider<PeamanChipProvider, Map<String, dynamic>>((ref) {
  return PeamanChipProvider();
});

class PeamanChipProvider extends StateNotifier<Map<String, dynamic>> {
  PeamanChipProvider() : super(<String, dynamic>{});

  void selectChip({
    required final String value,
    required final String groupId,
  }) {
    state = {
      ...state,
      groupId: value,
    };
  }

  void deselectChip({
    required final String value,
    required final String groupId,
  }) {
    if (isChipActive(value: value, groupId: groupId)) {
      state = Map<String, dynamic>.from(state)..remove(groupId);
    }
  }

  String? getActiveChip({
    required final String groupId,
  }) {
    return state[groupId];
  }

  bool isChipActive({
    required final String value,
    required final String groupId,
  }) {
    return getActiveChip(groupId: groupId) == value;
  }
}
