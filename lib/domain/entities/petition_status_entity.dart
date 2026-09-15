import 'package:pragma_test/domain/contstants/errors_constants.dart';

enum PetitionStatus {
  notStarted,
  loading,
  complete,
  failed,
}

class PetitionStatusEntity<T> {
  PetitionStatus status;
  T? data;
  String? error;

  PetitionStatusEntity({
    this.status = PetitionStatus.loading,
    this.data,
    this.error,
  });

  PetitionStatusEntity.notStarted() : status = PetitionStatus.notStarted;

  factory PetitionStatusEntity.success({T? data}) {
    return PetitionStatusEntity(
      status: PetitionStatus.complete,
      data: data,
    );
  }

  factory PetitionStatusEntity.loading() {
    return PetitionStatusEntity(status: PetitionStatus.loading);
  }

  /// Expects [error] to already be a classified key from [ErrorsConstants]
  /// (the data layer, e.g. RestApi, is responsible for mapping transport
  /// exceptions like TimeoutException/SocketException/HTTP status codes to
  /// one of those keys before it reaches the domain layer). Anything else
  /// falls back to [defaultError] so raw exception text never leaks to the UI.
  factory PetitionStatusEntity.fromError(dynamic error,
      {String? defaultError}) {
    String? errorGetted;
    if (error is String) {
      errorGetted = ErrorsConstants.existsKey(error)
          ? error
          : (defaultError ?? error);
    } else {
      errorGetted = defaultError ?? ErrorsConstants.unknownError;
    }
    return PetitionStatusEntity(
      status: PetitionStatus.failed,
      error: errorGetted,
    );
  }

  bool get isSuccess => status == PetitionStatus.complete;
  bool get isError => status == PetitionStatus.failed;
  bool get isLoading => status == PetitionStatus.loading;
  bool get isNotStarted => status == PetitionStatus.notStarted;

  PetitionStatusEntity changeStatus(PetitionStatus status) {
    return PetitionStatusEntity(
      status: status,
      data: data,
      error: error,
    );
  }

  PetitionStatusEntity setLoading() {
    return changeStatus(PetitionStatus.loading);
  }

  @override
  String toString() {
    return 'PetitionStatusEntity{status: $status, data: $data, error: $error}';
  }

  PetitionStatusEntity<T> copyWith({
    PetitionStatus? status,
    T? data,
    String? error,
  }) {
    return PetitionStatusEntity<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  PetitionStatusEntity<R> map<R>(R Function(T) transform) {
    if (isError) {
      return PetitionStatusEntity<R>(
        status: status,
        error: error,
      );
    }
    return PetitionStatusEntity<R>(
      status: status,
      data: data != null ? transform(data as T) : null,
      error: error,
    );
  }
}
