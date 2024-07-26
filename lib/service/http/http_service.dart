import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../config/app_config.dart';
import '../../config/app_local.dart';

// ignore: constant_identifier_names
enum RequestType { GET, POST, PUT, PATCH, DELETE }

class HttpService {
  late Dio dio;

  AppConfig appConfig = AppConfig();
  AppLocal appLocal = AppLocal();

  Future<Response> request({
    required RequestType type,
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic dataRequest,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    String? country,
  }) async {
    await configInitApi(country);
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

  Future configInitApi(String? country) async {
    String language = 'English';
    if(appLocal.local.value == LanguageLocal.pt){
      language = 'Portuguese';
    }
    dio = Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        headers: {
          'authorization': 'Bearer ${appConfig.bearerToken}',
          'language': language,
          if(country != null)
            'country': country,
        },
        validateStatus: (status) => status!  < 400,
        receiveTimeout: const Duration(seconds: 20),
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

  late DateTime timeRequest;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final logger = Logger(
    //   printer: PrettyPrinter(
    //       methodCount: 0,
    //       lineLength: 110,
    //       errorMethodCount: 0,
    //       colors: true,
    //       printEmojis: true
    //   ),
    // );
    // logger.d(
    //     '====== R E Q U E S T ======\n\n'
    //     '[DATE] => ${DateTime.now()}\n'
    //     '[METHOD] => ${options.method}\n'
    //     '[PATH] => ${options.path}\n'
    //     '[BODY] => ${options.data}'
    // );
    super.onRequest(options, handler);
    timeRequest = DateTime.now();
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Duration duration = DateTime.now().difference(timeRequest);
    String time = '';
    if(duration.inSeconds > 0){
      time = '${duration.inSeconds}.${duration.inMilliseconds.toString().substring(duration.inSeconds.toString().length)} s';
    } else if(duration.inMilliseconds > 0) {
      time = '${duration.inMilliseconds} ms';
    } else {
      time = '${duration.inMicroseconds} microseconds';
    }
    final logger = Logger(
      printer: PrettyPrinter(
          methodCount: 0,
          lineLength: 90,
          errorMethodCount: 0,
          colors: true,
          printEmojis: true
      ),
    );
    logger.d('====== R E S P O N S E ======\n\n'
        '[DATE] -----> ${DateTime.now()}\n'
        '[TIME] -----> $time\n'
        '[METHOD] ---> ${response.requestOptions.method}\n'
        '[STATUS] ---> ${response.statusCode}\n'
        '[HOST] -----> ${response.realUri.host}\n'
        '[PATH] -----> ${response.requestOptions.path}\n'
        '[BODY] -----> ${response.requestOptions.data}\n'
        '[RESPONSE] -> ${response.data}'
    );
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final logger = Logger(
      printer: PrettyPrinter(
          methodCount: 1,
          lineLength: 110,
          errorMethodCount: 5,
          colors: true,
          printEmojis: true
      ),
    );
    logger.e('====== E R R O R ======\n\n'
        '[DATE]     -> ${DateTime.now()}\n'
        '[METHOD]   -> ${err.requestOptions.method}\n'
        '[STATUS]   -> ${err.response?.statusCode ?? 500}\n'
        '[PATH]     -> ${err.requestOptions.path}\n'
        '[BODY]     -> ${err.requestOptions.data}\n'
        '[MESSAGE]  -> ${err.message}\n'
        '[ERROR]    -> ${err.error}\n'
        '[RESPONSE] -> ${err.response?.data}'
    );
    log(err.message.toString());
    log(err.response?.data?.toString() ?? '');
    super.onError(err, handler);
  }
}
