import 'package:equatable/equatable.dart';

const String _kunexpected = 'Unexpected failure';

abstract class Failure with EquatableMixin {
  const Failure({this.properties});

  final List? properties;

  @override
  String toString() => _kunexpected;
  @override
  List<Object?> get props => [properties];
}

class ServerFailure extends Failure {
  const ServerFailure({this.message = 'Server failure'});
  final String? message;

  @override
  String toString() => message ?? super.toString();
}

class InvalidServiceFailure extends Failure {
  const InvalidServiceFailure({this.message = 'This service does not exist'});
  final String? message;

  @override
  String toString() => message ?? super.toString();
}

class ServiceOfflineFailure extends Failure {
  const ServiceOfflineFailure(
      {this.message = 'This service is temporarily offline'});
  final String? message;

  @override
  String toString() => message ?? super.toString();
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({this.message = 'Not found failure'});
  final String? message;

  @override
  String toString() => message ?? super.toString();
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({this.message = 'Bad request failure'});
  final String? message;

  @override
  String toString() => message ?? super.toString();
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure({this.message = 'Authentication failure'});
  final String? message;

  @override
  String toString() => message ?? super.toString();
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({this.message = 'Unexpected failure'});
  final String? message;

  @override
  String toString() => message ?? super.toString();
}
