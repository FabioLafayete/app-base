import 'dart:io';

import 'package:dio/dio.dart';
import '../../config/app_config.dart';

// ignore: constant_identifier_names
enum RequestType { GET, POST, PUT, PATCH, DELETE }

class HttpService {
  late Dio dio;

  AppConfig appConfig = AppConfig();

  Future<Response> request({
    required RequestType type,
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic dataRequest,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    await configInitApi();
    try {
      return dio.request(
        path,
        data: dataRequest,
        queryParameters: queryParameters,
        options: _checkOptions(type.toString().split('.').last, options),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

    } catch (error) {
      if(error is DioError){
        print(error.message);
        print(error.response?.statusCode);
        print(error.requestOptions.uri);
      } else {
        print(error);
      }
      throw(error.toString());
    }
  }

  configInitApi() async {
    dio = Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        headers: {HttpHeaders.authorizationHeader: 'Bearer ${appConfig.bearerToken}'},
        validateStatus: (status) => status!  < 400,
        receiveTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
      ),
    );
  }


  Options _checkOptions(String method, options) {
    options ??= Options();
    options.method = method;
    return options;
  }

}
