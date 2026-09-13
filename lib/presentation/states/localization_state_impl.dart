import 'package:flutter/cupertino.dart';
import 'package:pragma_test/domain/repositories/localization_repository.dart';
import 'package:pragma_test/domain/states/localization_state.dart';

class LocalizationStateImpl extends LocalizationState with ChangeNotifier {
  final LocalizationRepository localizationRepository;

  LocalizationStateImpl({required this.localizationRepository}) {
    _load();
  }

  String _locale = 'es';
  @override
  String get locale => _locale;
  @override
  set locale(String locale) {
    _locale = locale;
    _load();
  }

  Map<String, String> _localizedStrings = {};

  Future<void> _load() async {
    _localizedStrings = await localizationRepository.getTranslations(_locale);
    notifyListeners();
  }

  @override
  String translate(String keyText, {Map<String, dynamic>? values}) {
    String? string = _localizedStrings[keyText];
    if (string == null) return keyText;
    if (values == null || values.keys.isEmpty) {
      return string;
    }
    for (String key in values.keys) {
      try {
        string = string!.replaceAll('{$key}', '${values[key]}');
      } catch (e) {
        return "";
      }
    }
    return string!;
  }
}
