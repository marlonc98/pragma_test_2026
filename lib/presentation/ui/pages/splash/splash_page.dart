import 'package:flutter/cupertino.dart';
import 'package:pragma_test/presentation/ui/pages/splash/splash_page_screen.dart';
import 'package:pragma_test/presentation/ui/pages/splash/splash_page_view_model.dart';
import 'package:pragma_test/presentation/ui/utils/stf_view_model_adapter.dart';

class SplashPage extends StatefulWidget {
  static const String route = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return StfViewModelAdapter(
      create: () => SplashPageViewModel(
        context: context,
        widget: widget,
        isMounted: () => mounted,
      ),
      builder: (context, viewModel) => SplashPageScreen(),
    );
  }
}
