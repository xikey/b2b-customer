import '../error/http_exception.dart';

abstract class DataState<T> {
  final T? data;
  final HttpExceptionData? error;

  const DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data, null);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(HttpExceptionData error) : super(null, error);
}
