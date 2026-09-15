import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pragma_test/presentation/constants/image_constants.dart';

class SplashLoadingLottieWidget extends StatelessWidget {
  final double height;
  const SplashLoadingLottieWidget({super.key, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Lottie.asset(ImageConstants.splashLoading, height: height),
    );
  }
}
