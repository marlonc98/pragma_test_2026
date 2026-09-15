import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/ui/widgets/images/splash_loading_lottie_widget.dart';

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
          const SplashLoadingLottieWidget(),
        ],
      ),
    );
  }
}
