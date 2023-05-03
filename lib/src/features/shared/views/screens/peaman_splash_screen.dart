import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

class PeamanSplashScreen extends ConsumerWidget {
  const PeamanSplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PeamanText.heading4(
              'Peaman',
              style: GoogleFonts.caveat(
                fontSize: 78.sp,
              ),
            ),
            PeamanText.body2(
              'A service for building social media\napps with ease!',
              textAlign: TextAlign.center,
              style: GoogleFonts.kalam(
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
