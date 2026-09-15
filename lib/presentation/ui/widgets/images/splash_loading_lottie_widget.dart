import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pragma_test/presentation/constants/image_constants.dart';

class SplashLoadingLottieWidget extends StatelessWidget {
  final double height;
  final double? width;
  final BoxFit fit;
  const SplashLoadingLottieWidget({
    super.key,
    this.height = 200,
    this.width,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Lottie.asset(
        ImageConstants.splashLoading,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
