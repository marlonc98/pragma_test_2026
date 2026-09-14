import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cat/detailed/detailed_cat_page.dart';
import 'package:pragma_test/presentation/ui/pages/cats/cats_page.dart';
import 'package:pragma_test/presentation/ui/pages/splash/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case CatsPage.route:
        return MaterialPageRoute(builder: (_) => CatsPage());
      case DetailedCatPage.route:
        return MaterialPageRoute(
          builder: (_) => args as DetailedCatPage,
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
