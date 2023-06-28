import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanErrorBuilder extends StatelessWidget {
  final String? title;
  final String subTitle;

  const PeamanErrorBuilder({
    Key? key,
    this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (title != null)
              PeamanText.subtitle1(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            if (title != null)
              SizedBox(
                height: 10.h,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PeamanText.body2(
                subTitle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
