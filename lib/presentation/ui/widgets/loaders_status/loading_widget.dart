import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pragma_test/presentation/constants/image_constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 8),
          Lottie.asset(ImageConstants.splashLoading, height: 200),
        ],
      ),
    );
  }
}
