class ErrorsConstants {
  static const String unauthorized = 'unauthorized';
  static const String unknownError = "unknownError";
  static const String noInternet = "noInternet";
  static const String timeout = "timeout";
  static const String tokenExpired = "tokenExpired";
  static const String noUserFound = "noUserFound";

  static const String wrongCredentials = "wrongCredentials";
  static const String accountNotConfirmed = "accountNotConfirmed";
  static const String failedToLogin = "failedToLogin";

  static const String failedUpdatingLanguage = "failedUpdatingLanguage";
  static const String languageUpdatedWithError = "languageUpdatedWithError";

  static const String failedVerifying2fa = "failedVerifying2fa";

  static const String failedToRefreshToken = "failedToRefreshToken";

  static const String failedGettingNewsUpdates = "failedGettingNewsUpdates";
  static const String failedToGetPatients = "failedToGetPatients";

  static const String errorGetingUtilizationPer1k = "errorGetingUtilizationPer1k";
  static const String errorGettingData = "errorGettingData";
  static const String errorGettingPatients = "errorGettingPatients";
  static const String errorGettingAllPatientEvents = "errorGettingAllPatientEvents";
  static const String failedUpdatingPatientEvent = "failedUpdatingPatientEvent";
  static const String failedCreatingPatientEvent = "failedCreatingPatientEvent";

  static const String failedConfirmingAccount = "failedConfirmingAccount";
  static const String failedResendingConfirmationCode = "failedResendingConfirmationCode";
  static const String failedToUpdatePassword = "failedToUpdatePassword";

  static const String failedGettingContactMes = "failedGettingContactMes";
  static const String failedGettingContactMe = "failedGettingContactMe";
  static const String failedDeletingContactMe = 'failedDeletingContactMe';

  static const String failedGettingAplications = "failedGettingAplications";
  static const String failedGettingAplication = "failedGettingAplication";
  static const String failedDeletingAplication = "failedDeletingAplication";
  static const String failedUpdatingAplicationState =
      "failedUpdatingAplicationState";

  static const String failedGettingNeighborhoods = "failedGettingNeighborhoods";
  static const String failedSavingNeighborhood = "failedSavingNeighborhood";
  static const String failedDeletingNeighborhood = "failedDeletingNeighborhood";

  static const String failedShowingContactInfo = "failedShowingContactInfo";
  static const String failedEnablingContactInfo = "failedEnablingContactInfo";
  static const String failedCreatingContract = "failedCreatingContract";
  static const String errorBanningUser = "errorBanningUser";
  static const String errorDeletingAccount = "errorDeletingAccount";

  static const String errorGeneratingPayment = "errorGeneratingPayment";
  static const String errorLoadinComments = "errorLoadinComments";
  static const String errorSendingEmail = "errorSendingEmail";
  static const String failedGettingProperties = "failedGettingProperties";

  static const String failedCreatingLink = "failedCreatingLink";
  static const String failedGettingProperty = "failedGettingProperty";
  static const String failedUpdatingPropertyStatus = "failedUpdatingPropertyStatus";
  static const String failedDeletingProperty = "failedDeletingProperty";

  static bool existsKey(String key) {
    return [
      unauthorized,
      unknownError,
      noInternet,
      timeout,
      wrongCredentials,
      accountNotConfirmed,
      failedToLogin,
      tokenExpired,
      noUserFound,
      failedVerifying2fa,
      failedToRefreshToken,
      failedGettingNewsUpdates,
      failedToGetPatients,
      errorGettingData,
      errorGettingPatients,
      errorGettingAllPatientEvents,
      failedUpdatingPatientEvent,
      failedCreatingPatientEvent,
    ].contains(key);
  }
}
