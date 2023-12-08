class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => 'Failure: $message';
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class StorageFailure extends Failure {
  StorageFailure(super.message);
}
