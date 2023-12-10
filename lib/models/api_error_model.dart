import 'package:dio/dio.dart';
import 'package:skeleton_231210/constants/errors.dart';
import 'package:skeleton_231210/constants/messages.dart';

class ApiErrorModel {
  final String message;
  final List<String> errors;

  const ApiErrorModel({
    required this.message,
    required this.errors,
  });

  factory ApiErrorModel.fromDioError(DioException error) {
    Map<String, dynamic> json = error.response?.data ?? {};

    String message = ErrorConstants.getErrorMessage(json['message'] ?? '');
    if (message == MessagesConstants.validationFailed) {
      message =
      '${MessagesConstants.validationFailed} ${json['errors']?['name'] ?? ''}  ${json['errors']?['mail'] ?? ''}';
    }

    List<String> errors = [];
    json['errors']?.forEach((key, value) {
      String? error = ErrorConstants.errorCodeMessages[key];
      if (error != null) {
        errors.add(error);
      }
    });

    return ApiErrorModel(
      message: message,
      errors: errors,
    );
  }

  String formatMessage() {
    String formattedMessage = '$message\n';

    for (var error in errors) {
      formattedMessage = '${formattedMessage + error}\n';
    }

    return formattedMessage.isEmpty ? MessagesConstants.anErrorHasOccurred : formattedMessage;
  }
}