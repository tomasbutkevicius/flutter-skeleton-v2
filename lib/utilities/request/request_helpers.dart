import 'package:dio/dio.dart';
import 'package:skeleton_231210/constants/api.dart';
import 'package:skeleton_231210/constants/environment.dart';

class DioApi {
  static Dio? _instance;

  DioApi._internal();

  static Dio getInstance() {
    _instance ??= isProduction ? Dio(DioApi._getInstanceOptions()) : addInterceptors(Dio(DioApi._getInstanceOptions()));

    return _instance!;
  }

  static BaseOptions _getInstanceOptions() {
    return BaseOptions(
      listFormat: ListFormat.multiCompatible,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      baseUrl: environment.apiHost,
    );
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
        ),
      );
  }
}

class DioWeb {
  static Dio? _instance;

  DioWeb._internal();

  static Dio getInstance() {
    _instance ??= isProduction ? Dio(DioWeb._getInstanceOptions()) : addInterceptors(Dio(DioWeb._getInstanceOptions()));

    return _instance!;
  }

  static BaseOptions _getInstanceOptions() {
    return BaseOptions(
      listFormat: ListFormat.multiCompatible,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      baseUrl: environment.webHost,
      headers: {
        'Authorization': environment.webAuthKey,
      },
    );
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
        ),
      );
  }
}
