

abstract class Failure  {}

class ServerFailure extends Failure {

  final String? msg;
  ServerFailure({ this.msg});
  @override
  List<Object?> get props => [msg];
}