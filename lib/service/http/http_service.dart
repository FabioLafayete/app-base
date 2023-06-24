// import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
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
        headers: {'authorization': 'Bearer ${appConfig.bearerToken}'},
        validateStatus: (status) => status!  < 400,
        receiveTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 30),
      ),
    );
    dio.interceptors.add(CustomInterceptors());
  }

  Options _checkOptions(String method, options) {
    options ??= Options();
    options.method = method;
    return options;
  }

}

class CustomInterceptors extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final logger = Logger(
      printer: PrettyPrinter(
          methodCount: 0,
          lineLength: 110,
          errorMethodCount: 0,
          colors: true,
          printEmojis: true
      ),
    );
    logger.d(
        '====== R E Q U E S T ======\n\n'
        '[METHOD] => ${options.method}\n'
        '[PATH] => ${options.path}\n'
        '[BODY] => ${options.data}\n'
        '[DATE] => ${DateTime.now()}'
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final logger = Logger(
        printer: PrettyPrinter(
            methodCount: 0,
            lineLength: 110,
            errorMethodCount: 0,
            colors: true,
            printEmojis: true
        ),
    );
    logger.d(
        '====== R E S P O N S E ======\n\n'
        '[METHOD] => ${response.requestOptions.method}\n'
        '[STATUS] => ${response.statusCode}\n'
        '[PATH] => ${response.requestOptions.path}\n'
        '[BODY] => ${response.requestOptions.data}\n'
        '[RESPONSE] => ${response.data}\n'
        '[DATE] => ${DateTime.now()}'
    );
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final logger = Logger(
      printer: PrettyPrinter(
          methodCount: 0,
          lineLength: 110,
          errorMethodCount: 0,
          colors: true,
          printEmojis: true
      ),
    );
    logger.d(
        '====== E R R O R ======\n\n'
        '[METHOD] => ${err.requestOptions.method}\n'
        '[STATUS] => ${err.response?.statusCode}\n'
        '[PATH] => ${err.requestOptions.path}\n'
        '[BODY] => ${err.requestOptions.data}'
        '[RESPONSE] => ${err.response}\n'
        '[MESSAGE] => ${err.message}\n'
        '[DATE] => ${DateTime.now()}'
    );
    super.onError(err, handler);
  }
}
