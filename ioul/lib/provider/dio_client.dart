import 'package:ioul/provider/shared_prefrence.dart';

import '../helpers/enum.dart';
import '../packages/package.dart';
import 'dio_interceptors.dart';
import 'endpoints.dart';

class DioClient {
  final Dio _dio = Dio();
  DioClient() {
    _dio
      ..options.baseUrl = baseApi
      ..options.contentType = Headers.jsonContentType
      ..options.responseType = ResponseType.plain
      ..options.followRedirects = false
      ..options.connectTimeout = const Duration(minutes: 1)
      ..options.receiveTimeout = const Duration(minutes: 1)
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (e, handler) async {
          String accessToken = await AppPrefs().getToken();
          if (accessToken.isNotEmpty) {
            e.headers['Authorization'] = 'Bearer $accessToken';
          }
          e.headers['Accept'] = "application/json";
          return handler.next(e);
        },
        onResponse: (e, handler) {
          return handler.next(e);
        },
        onError: (error, handler) => handler.next(error),
      ))
      ..interceptors.add(DioInterceptors())
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        responseBody: true,
      ));
  }

  Future<Response> request({
    required MethodType type,
    required String url,
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) {
    return switch (type) {
      MethodType.post =>
        _dio.post(url, data: body, queryParameters: queryParams),
      MethodType.get => _dio.get(url, queryParameters: queryParams),
      MethodType.put => _dio.put(url, data: body, queryParameters: queryParams),
      MethodType.patch =>
        _dio.patch(url, data: body, queryParameters: queryParams),
      MethodType.delete => _dio.delete(url, queryParameters: queryParams),
    };
  }

  String token = '';

  void setToken(String value) {
    token = value;
  }

  // Future<Response> formRequest({
  //   required MethodType type,
  //   required String url,
  //   required dynamic body,
  //   Map<String, dynamic>? queryParams,
  // }) {
  //   return switch (type) {
  //     MethodType.post => _dio.post(
  //         url,
  //         data: body,
  //         queryParameters: queryParams,
  //         options: Options(
  //           contentType: "multipart/form-data",
  //           responseType: ResponseType.plain,
  //         ),
  //       ),
  //     MethodType.get => _dio.get(url, queryParameters: queryParams),
  //     MethodType.put => _dio.put(url, data: body, queryParameters: queryParams),
  //     MethodType.patch =>
  //       _dio.patch(url, data: body, queryParameters: queryParams),
  //     MethodType.delete => _dio.delete(url, queryParameters: queryParams),
  //   };
  // }
}
