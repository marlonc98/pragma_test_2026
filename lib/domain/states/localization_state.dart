abstract class LocalizationState {
  abstract String locale;
  String translate(String keyText, {Map<String, dynamic>? values});
}
