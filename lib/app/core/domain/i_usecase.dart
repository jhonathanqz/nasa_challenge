abstract interface class IUsecase<Output, Input> {
  Future<Output> call(Input params);
}

class NoParams {}

class UsecaseResult<T> {
  final T? data;
  final String? error;

  UsecaseResult({required this.data, this.error});

  factory UsecaseResult.success(T data) {
    return UsecaseResult(data: data, error: null);
  }

  factory UsecaseResult.error(String error) {
    return UsecaseResult(data: null, error: error);
  }

  bool get isSuccess => data != null && error == null;
  bool get isError => data == null && error != null;
}
