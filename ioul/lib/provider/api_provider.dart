import 'dart:async';
import 'dart:convert';
import 'dart:io';
import "package:dio/dio.dart";
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../model/register_student.dart';
import '../response/response.dart';
import 'endpoints.dart';

class ApiProvider {
  Future<GenericResponse> pushRegisterStudent(Register register) async {
    int? statusCode;
    try {
      //print("student registration request payload: $cashAdvanceRequest");
      Response response = await doPostRequest(registerEndpoint, register);
      statusCode = response.statusCode;

      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.toString());

        var requestResponse = GenericResponse.fromJson(decodedBody);
        requestResponse.statusCode = statusCode!;

        return requestResponse;
      } else {
        var requestResponse = GenericResponse();
        requestResponse.statusCode = statusCode!;
        requestResponse.message = response.statusMessage;

        return requestResponse;
        //return _createDefaultGenericResponse(statusCode);
      }
    } on DioException catch (e) {
      var requestResponse = GenericResponse();
      //requestResponse.statusCode = statusCode!;
      requestResponse.message = _handleDioError(e); //e.message;

      return requestResponse;
    }
  }

  Future<GenericResponse> getCountryList({String? endpoint}) async {
    int? statusCode;
    try {
      Response response = await doGetRequest(countries);
      statusCode = response.statusCode;
      //print("state response: ${response.toString()}");

      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.toString());

        var requestResponse = GenericResponse.fromJson(decodedBody);
        requestResponse.statusCode = statusCode!;
        return requestResponse;
      } else {
        var requestResponse = GenericResponse();
        requestResponse.statusCode = statusCode!;
        return requestResponse;
      }
    } on DioException catch (e) {
      var requestResponse = GenericResponse();
      //requestResponse.statusCode = statusCode ?? e.response.statusCode;
      requestResponse.message = _handleDioError(e);

      return requestResponse;
    }
  }
}

Future<Response> doGetRequest(String endPoint) async {
  endPoint = endPoint.replaceAll("*", "");
  var dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  dio.options.baseUrl = baseApi;
  dio.options.connectTimeout = const Duration(minutes: 5); //30s
  dio.options.receiveTimeout = const Duration(minutes: 5); // 2 min
  return dio.get(endPoint);
}

Future<Response> doPostRequest(endPoint, dynamic body) async {
  endPoint = endPoint.replaceAll("*", "");
  var dio = Dio();
  dio.options.baseUrl = baseApi;
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  dio.options.connectTimeout = const Duration(minutes: 3); //30s
  dio.options.receiveTimeout = const Duration(minutes: 3); // 2 min

  // return dio.post(endPoint,
  //     data: jsonEncode(body), options: Options(headers: header));

  Response response =
      Response(requestOptions: RequestOptions(method: "post", path: endPoint));
  try {
    response = await dio.post(endPoint, data: jsonEncode(body));
  } on DioException catch (e) {
    response.statusMessage =
        (e.response?.statusCode ?? 500).toString().startsWith("5")
            ? "something_went_wrong_and_your_request_could_not_be_completed"
            : e.response.toString();
    response.statusCode = e.response?.statusCode ?? 500;
  }

  return response;
}

bool _isConnectionSuccessful(int? statusCode) =>
    statusCode == 200 || statusCode == 201;

_handleDioError(DioException error) {
  if (error.error != null && error.error is SocketException) {
    return "connection_to_server_failed_due_to_internet_connection";
  }

  String errorDescription = "";
  switch (error.type) {
    case DioExceptionType.cancel:
      errorDescription = "request_to_server_was_cancelled";
      break;
    case DioExceptionType.connectionTimeout:
      errorDescription = "connection_timeout_with_server";
      break;
    case DioExceptionType.connectionError:
      errorDescription =
          "connection_to_server_failed_due_to_internet_connection";
      break;
    case DioExceptionType.badCertificate:
      errorDescription = "Bad Certificate";
      break;
    case DioExceptionType.badResponse:
      errorDescription = "Bad response from the server";
      break;
    case DioExceptionType.receiveTimeout:
      errorDescription = "receive_timeout_in_connection_with_server";
      break;
    case DioExceptionType.sendTimeout:
      errorDescription = "send_timeout_in_connection_with_server";
      break;
    case DioErrorType.unknown:
      errorDescription =
          "something_went_wrong_and_your_request_could_not_be_completed";
      break;
  }
  return errorDescription;
}
