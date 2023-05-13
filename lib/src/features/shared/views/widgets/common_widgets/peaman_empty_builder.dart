import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanEmptyBuilder extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const PeamanEmptyBuilder({
    Key? key,
    this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (title != null)
              PeamanText.subtitle1(
                '$title',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(
              height: 10.0,
            ),
            if (subTitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: PeamanText.body2(
                  '$subTitle',
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
