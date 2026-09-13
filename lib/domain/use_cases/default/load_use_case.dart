import 'package:pragma_test/domain/repositories/localization_repository.dart';
import 'package:pragma_test/domain/states/localization_state.dart';

class LoadUseCase {
  final LocalizationRepository localizationRepository;
  final LocalizationState localizationState;

  LoadUseCase({
    required this.localizationState,
    required this.localizationRepository,
  });

  Future<void> call() async {
    final locale = await localizationRepository.getLanguage();
    localizationState.locale = locale;
  }
}
