import 'package:app/interface/base_model_interface.dart';
import 'package:dio/dio.dart';
import '../../config/app_config.dart';

enum RequestType { GET, POST, PUT, PATCH, DELETE }

class HttpService {
  late Dio dio;

  AppConfig appConfig = AppConfig();

  HttpService() {
    configInitApi();
  }

  Future<T> request<T>({
    required RequestType type,
    required String path,
    BaseModelInterface? dataResponse,
    BaseModelInterface? dataRequest,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response res = await dio.request(
        path,
        data: dataRequest?.toJson(),
        queryParameters: queryParameters,
        options: _checkOptions(type.toString().split('.').last, options),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (dataResponse == null) {
        return res.data;
      }
      if (res.data is List) {
        return dataResponse.fromJsonArray(res.data) as T ?? res.data as T;
      }
      return dataResponse.fromJson(res.data) as T ?? res.data as T;
    } catch (error) {
      if(error is DioError){
        print(error.message);
        print(error.response?.statusCode);
        print(error.requestOptions.uri);
      }
      print(error);
      throw(error.toString());
    }
  }

  configInitApi() async {
    dio = Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        validateStatus: (status) => status!  < 400,
        receiveTimeout: 10000,
        connectTimeout: 5000,
      ),
    );
  }


  Options _checkOptions(String method, options) {
    options ??= Options();
    options.method = method;
    return options;
  }

}
