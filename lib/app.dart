import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/ui/routes/route_generator.dart';
import 'package:pragma_test/presentation/ui/theme/dark_theme.dart';
import 'package:pragma_test/presentation/ui/theme/light_theme.dart';
import 'flavors/flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      theme: lightTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      darkTheme: darkTheme,
    );
  }

}
