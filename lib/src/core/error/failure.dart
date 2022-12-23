import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

/// Failure returned when there is there is a
/// [CacheException] thrown.
class CacheFailure extends Failure {}
