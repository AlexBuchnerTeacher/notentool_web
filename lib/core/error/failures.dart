import 'package:equatable/equatable.dart';

/// Base class for all failures in the application
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Failure for server-related errors
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Failure for cache-related errors
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Failure for network-related errors
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Failure for authentication-related errors
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

/// Failure for validation errors
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}
