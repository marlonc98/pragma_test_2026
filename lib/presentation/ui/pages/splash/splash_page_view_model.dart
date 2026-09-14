import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pragma_test/domain/use_cases/default/load_use_case.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cats_page.dart';
import 'package:pragma_test/presentation/ui/pages/splash/splash_page.dart';
import 'package:pragma_test/presentation/ui/utils/view_model.dart';

class SplashPageViewModel extends ViewModel<SplashPage> {
  SplashPageViewModel({
    required super.context,
    required super.widget,
    required super.isMounted,
  }) {
    _loadVersionAndBuildNumber();
    _load();
  }

  PackageInfo? packageInfo;

  Future<void> _loadVersionAndBuildNumber() async {
    packageInfo = await PackageInfo.fromPlatform();
    notifyListeners();
  }

  Future<void> _load() async {
    await Future.wait([
     Future.delayed(const Duration(milliseconds: 500)),
     getIt.get<LoadUseCase>().call()
     
    ]);
    if (mounted) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).popAndPushNamed(CatsPage.route);
    }
  }
}
