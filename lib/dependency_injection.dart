import 'package:get_it/get_it.dart';
import 'package:pragma_test/data/localization/localization_repository_impl.dart';
import 'package:pragma_test/data/localization/localization_repository_mock.dart';
import 'package:pragma_test/domain/repositories/localization_repository.dart';
import 'package:pragma_test/domain/states/localization_state.dart';
import 'package:pragma_test/domain/use_cases/default/load_use_case.dart';
import 'package:pragma_test/flavors/flavors.dart';
import 'package:pragma_test/presentation/states/localization_state_impl.dart';

class DependencyInjection {
  DependencyInjection() {
    GetIt getIt = GetIt.instance;
    //#region ------------- repositories -------------------------//
    Flavor? mode = F.appFlavor;
    if (mode == Flavor.mock) {
      getIt.registerSingleton<LocalizationRepository>(
        LocalizationRepositoryMock(),
      );
    } else if (mode == Flavor.dev) {
      getIt.registerSingleton<LocalizationRepository>(
        LocalizationRepositoryImpl(),
      );
    } else {
      getIt.registerSingleton<LocalizationRepository>(
        LocalizationRepositoryImpl(),
      );
    }
    //#endregion repositories

    final localizationStateImpl = LocalizationStateImpl(
      localizationRepository: getIt.get<LocalizationRepository>(),
    );

    //#region ------------- States -------------------------//
    getIt.registerSingleton<LocalizationState>(localizationStateImpl);
    getIt.registerSingleton<LocalizationStateImpl>(localizationStateImpl);
    //#endregion ---------- States ------------------------//

    //#region ------------- use cases -------------------------//
    //#region ------------- localization -------------------------//
    //#endregion ---------- localization -------------------------//
    //#region ------------- default -------------------------//
    getIt.registerSingleton<LoadUseCase>(
      LoadUseCase(
        localizationState: getIt.get<LocalizationState>(),
        localizationRepository: getIt.get<LocalizationRepository>(),
      ),
    );
    //#endregion ---------- default -------------------------//
  }
}
