import 'package:get_it/get_it.dart';
import 'package:pragma_test/data/repositories/cat/cat_repository_dev.dart';
import 'package:pragma_test/data/repositories/cat/cat_repository_impl.dart';
import 'package:pragma_test/data/repositories/cat/cat_repository_mock.dart';
import 'package:pragma_test/data/repositories/localization/localization_repository_impl.dart';
import 'package:pragma_test/data/repositories/localization/localization_repository_mock.dart';
import 'package:pragma_test/domain/repositories/cat_repository.dart';
import 'package:pragma_test/domain/repositories/localization_repository.dart';
import 'package:pragma_test/domain/states/localization_state.dart';
import 'package:pragma_test/domain/use_cases/cat/get_cat_by_id_use_case.dart';
import 'package:pragma_test/domain/use_cases/cat/search_cats_use_case.dart';
import 'package:pragma_test/domain/use_cases/default/load_use_case.dart';
import 'package:pragma_test/flavors/flavors.dart';
import 'package:pragma_test/presentation/states/localization_state_impl.dart';

class DependencyInjection {
  DependencyInjection() {
    GetIt getIt = GetIt.instance;
    //#region ------------- repositories -------------------------//
    Flavor? mode = F.appFlavor;
    if (mode == Flavor.mock) {
      getIt.registerSingleton<CatRepository>(
        CatRepositoryMock(),
      );
      getIt.registerSingleton<LocalizationRepository>(
        LocalizationRepositoryMock(),
      );
    } else if (mode == Flavor.dev) {
      getIt.registerSingleton<CatRepository>(
        CatRepositoryDev(),
      );
      getIt.registerSingleton<LocalizationRepository>(
        LocalizationRepositoryImpl(),
      );
    } else {
      getIt.registerSingleton<CatRepository>(
        CatRepositoryImpl(),
      );
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
    getIt.registerSingleton<SearchCatsUseCase>(
      SearchCatsUseCase(
        catRepository: getIt.get<CatRepository>(),
      ),
    );
    getIt.registerSingleton<GetCatByIdUseCase>(
      GetCatByIdUseCase(
        catRepository: getIt.get<CatRepository>(),
      ),
    );
    //#region ------------- cats -------------------------//
    //#endregion ---------- cats -------------------------//
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
