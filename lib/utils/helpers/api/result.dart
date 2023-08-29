class Result<T> {
  Result({this.data, this.exception});

  T? data;
  Exception? exception;

  bool get hasData => data != null;

  bool get isError => exception != null;

  R fold<R>(R Function(T? data) right, R Function(Exception exception) left) {
    return isError ? left(exception!) : right(data);
  }
}

class NetworkResult<T> extends Result<T> {
  NetworkResult({T? data, Exception? exception})
      : super(data: data, exception: exception);
}