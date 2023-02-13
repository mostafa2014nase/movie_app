import 'package:equatable/equatable.dart';

class FailureHandler extends Equatable {
  final String errorMsg;

  const FailureHandler(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}

class NetWorkFailure extends FailureHandler {
  const NetWorkFailure(super.errorMsg);
}

class LocalFailure extends FailureHandler {
  const LocalFailure(super.errorMsg);
}