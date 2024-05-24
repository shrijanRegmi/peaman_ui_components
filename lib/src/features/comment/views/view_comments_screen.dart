import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewCommentsScreen extends ConsumerStatefulWidget {
  const ViewCommentsScreen({super.key});

  static const route = '/view_comments';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ViewCommentsScreenState();
}

class _ViewCommentsScreenState extends ConsumerState<ViewCommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
