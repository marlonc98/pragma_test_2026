import 'package:pragma_test/data/localization/api/get_translatations_api_impl.dart';
import 'package:pragma_test/domain/repositories/localization_repository.dart';

class LocalizationRepositoryMock extends LocalizationRepository {
  @override
  Future<String> getLanguage() async {
    return "es";
  }

  @override
  Future<Map<String, String>> getTranslations(String locale) =>
      getTranslationsApiImpl(locale);
}
