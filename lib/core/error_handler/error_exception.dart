import 'package:movies_app/core/error_handler/error_model_response.dart';

class ErrorNetWorkException implements Exception {
  final ErrorModelResponse errorModelResponse;

  const ErrorNetWorkException({required this.errorModelResponse});
}

class ErrorLocalException implements Exception {
  final String errorMsg;

  const ErrorLocalException({required this.errorMsg});
}
