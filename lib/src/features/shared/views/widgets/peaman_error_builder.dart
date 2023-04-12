import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanErrorBuilder extends StatelessWidget {
  final String title;
  final String subTitle;

  const PeamanErrorBuilder({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PeamanText.subtitle1(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PeamanText.body2(
                subTitle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
