import 'package:equatable/equatable.dart';

class ErrorModelResponse extends Equatable {
  final bool status;
  final int statusCode;
  final String errorMsg;

  const ErrorModelResponse({
    required this.status,
    required this.statusCode,
    required this.errorMsg,
  });

  factory ErrorModelResponse.fromJson(Map<String, dynamic> json) =>
      ErrorModelResponse(
        status: json["success"],
        statusCode: json["status_code"],
        errorMsg: json["status_message"],
      );

  @override
  List<Object?> get props =>[status,statusCode,errorMsg];
}
