import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

// async value of peaman user
typedef AVPUE = AsyncValue<PeamanEither<PeamanUser, PeamanError>>;

// async value of list of peaman users
typedef AVPUSE = AsyncValue<PeamanEither<List<PeamanUser>, PeamanError>>;

// async value of peaman chat
typedef AVPCE = AsyncValue<PeamanEither<PeamanChat, PeamanError>>;

// async value of list of peaman chats
typedef AVPCSE = AsyncValue<PeamanEither<List<PeamanChat>, PeamanError>>;

// async value of list of peaman chats stream
typedef AVPCS = AsyncValue<List<PeamanChat>>;
