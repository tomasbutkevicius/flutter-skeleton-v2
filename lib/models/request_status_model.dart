import 'package:skeleton_231210/models/api_error_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:skeleton_231210/constants/messages.dart';

enum RequestStatusValue { fetching, error, done, init }

@immutable
class RequestStatus extends Equatable {
  final String? message;
  final RequestStatusValue value;

  const RequestStatus({
    this.message,
    this.value = RequestStatusValue.init,
  });

  factory RequestStatus.error({String? error}) {
    return RequestStatus(
      message: error ?? MessagesConstants.anErrorHasOccurred,
      value: RequestStatusValue.error,
    );
  }

  factory RequestStatus.errorDio(DioException error) {
    return RequestStatus(
      message: ApiErrorModel.fromDioError(error).formatMessage(),
      value: RequestStatusValue.error,
    );
  }

  @override
  List<Object?> get props => [message, value];

  static const init = RequestStatus();
  static const done = RequestStatus(value: RequestStatusValue.done);
  static const fetching = RequestStatus(value: RequestStatusValue.fetching);
}
