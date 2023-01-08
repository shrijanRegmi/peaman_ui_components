import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PeamanChatMessageTypingIndicator extends StatelessWidget {
  const PeamanChatMessageTypingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      'assets/lotties/typing.json',
      height: 50.0,
    );
  }
}
