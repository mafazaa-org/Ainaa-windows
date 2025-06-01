// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class Result<T, K> {
  const Result();
  R when<R>({
    required R Function(T value) success,
    required R Function(K error) failure,
  });
}

class Success<T, K> extends Result<T, K> {
  final T value;
  const Success(this.value);

  @override
  R when<R>({
    required R Function(T value) success,
    required R Function(K error) failure,
  }) {
    return success(value);
  }

  @override
  String toString() => 'Success(value: ${value.toString()})';
}

class Failure<T, K> extends Result<T, K> {
  final K error;
  const Failure(this.error);

  @override
  R when<R>({
    required R Function(T value) success,
    required R Function(K error) failure,
  }) {
    return failure(error);
  }

  @override
  String toString() => 'Failure(error: ${error.toString()})';
}

extension ResultExtensions<T, K> on Result<T, K> {
  bool get isSuccess => this is Success<T, K>;
  bool get isFailure => this is Failure<T, K>;
  T get successData => (this as Success<T, K>).value;
  K get failureData => (this as Failure<T, K>).error;
}
