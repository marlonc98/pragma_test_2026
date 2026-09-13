
import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/ui/pages/splah/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
  
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => SplashPage());

      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
