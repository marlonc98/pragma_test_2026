import 'package:flutter/material.dart';
import 'package:pragma_test/presentation/ui/routes/route_generator.dart';
import 'flavors/flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

}
