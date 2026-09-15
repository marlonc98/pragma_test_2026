import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/constants/text_constants.dart';
import 'package:pragma_test/presentation/states/localization_state_impl.dart';
import 'package:pragma_test/presentation/ui/pages/splash/splash_page_view_model.dart';
import 'package:pragma_test/presentation/ui/widgets/images/splash_loading_lottie_widget.dart';
import 'package:provider/provider.dart';

class SplashPageScreen extends StatelessWidget {
  const SplashPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final i18n = context.watch<LocalizationStateImpl>();
    final vm = context.watch<SplashPageViewModel>();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.5 - 240),
              Text(
                i18n.translate(TextConstants.splashPageTitle),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SplashLoadingLottieWidget(),
              const SizedBox(height: 4),
              if (vm.packageInfo != null)
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    i18n.translate(
                      TextConstants.versionAndBuild,
                      values: {
                        "version": vm.packageInfo!.version,
                        "build": vm.packageInfo!.buildNumber,
                      },
                    ),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
