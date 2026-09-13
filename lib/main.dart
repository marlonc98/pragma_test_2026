import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:pragma_test/dependency_injection.dart';
import 'package:pragma_test/presentation/states/localization_state_impl.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'flavors/flavors.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );
  ensureInitFlavor();
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocalizationStateImpl>(
          create: (_) => GetIt.instance.get<LocalizationStateImpl>()),
    ],
    child: const App(),
  ));
}
