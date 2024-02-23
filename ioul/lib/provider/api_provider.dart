import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ioul/response/country_response.dart';
import 'package:ioul/response/programme_response.dart';
import 'package:ioul/response/register_response.dart';
import 'package:path/path.dart';
import '../model/model.dart';
import '../packages/package.dart';
import '../response/response.dart';
import 'endpoints.dart';
import 'shared_prefrence.dart';

class ApiProvider {
  Future<Login> login(
      String username, String password, String deviceToken) async {
    int? statusCode;
    try {
      var body = <String, String>{};
      body["email"] = username;
      body["password"] = password;

      Response response = await doPostRequest(loginEndpoint, body);
      statusCode = response.statusCode;

      log("Login response : ${response.toString()}");
      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.toString());
        var requestResponse = Login.fromJson(decodedBody);
        requestResponse.statusCode = statusCode!;
        return requestResponse;
      } else {
        var requestResponse = Login();
        requestResponse.statusCode = statusCode!;
        requestResponse.message = response.toString();
        return requestResponse;
      }
    } on DioException catch (e) {
      // print("Status error: ${e.response!.statusCode}");
      log("Response error: ${e.response!.data}");
      // print("Message error: ${e.message}");
      var requestResponse = Login();
      //requestResponse.statusCode = statusCode ?? e.response.statusCode;
      // requestResponse.statusMessage = _handleDioError(e);
      requestResponse.message = _handleDioError(e);
      return requestResponse;
    }
  }

  Future<GenericResponse> forgotPassword(String email) async {
    int statusCode;
    try {
      var body = <String, String>{};
      body["email"] = email;
      Response response = await doPostRequest(forgotPasswordEndpoint, body);

      statusCode = response.statusCode!;

      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.toString());

        var requestResponse = GenericResponse.fromJson(decodedBody);
        requestResponse.statusCode = statusCode;
        return requestResponse;
      } else {
        var requestResponse = GenericResponse();
        requestResponse.statusCode = statusCode;

        requestResponse.message = response.statusMessage;
        // print('status code ... ${requestResponse.message}');
        return requestResponse;
        //return _createDefaultGenericResponse(statusCode);
      }
    } on DioException catch (e) {
      // print("forgot password error: ${e.error}");
      var requestResponse = GenericResponse();
      //requestResponse.statusCode = statusCode;
      requestResponse.message = _handleDioError(e); //e.message;

      return requestResponse;
      //return _createDefaultGenericResponse(statusCode);
    }
  }

  Future<GenericResponse> newPassword(
      String password, String confirmPassword, String pin, String email) async {
    int statusCode;
    try {
      var body = <String, String>{};
      body["password"] = password;
      body["password_confirmation"] = confirmPassword;
      body["email"] = email;
      body["pin"] = pin;
      Response response = await doPostRequest(resetPasswordEndpoint, body);

      statusCode = response.statusCode!;

      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.toString());

        var requestResponse = GenericResponse.fromJson(decodedBody);
        requestResponse.statusCode = statusCode;
        return requestResponse;
      } else {
        var requestResponse = GenericResponse();
        requestResponse.statusCode = statusCode;

        requestResponse.message = response.statusMessage;
        // print('status code ... ${requestResponse.message}');
        return requestResponse;
        //return _createDefaultGenericResponse(statusCode);
      }
    } on DioException catch (e) {
      // print("forgot password error: ${e.error}");
      var requestResponse = GenericResponse();
      //requestResponse.statusCode = statusCode;
      requestResponse.message = _handleDioError(e); //e.message;

      return requestResponse;
      //return _createDefaultGenericResponse(statusCode);
    }
  }

  Future<GenericResponse> resetPassword(String pin, String email) async {
    int statusCode;
    try {
      var body = <String, String>{};
      body["email"] = email;
      body["pin"] = pin;
      Response response = await doPostRequest(verifyResetPasswordPin, body);

      statusCode = response.statusCode!;

      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.toString());

        var requestResponse = GenericResponse.fromJson(decodedBody);
        requestResponse.statusCode = statusCode;
        return requestResponse;
      } else {
        var requestResponse = GenericResponse();
        requestResponse.statusCode = statusCode;

        requestResponse.message = response.statusMessage;
        // print('status code ... ${requestResponse.message}');
        return requestResponse;
        //return _createDefaultGenericResponse(statusCode);
      }
    } on DioException catch (e) {
      // print("forgot password error: ${e.error}");
      var requestResponse = GenericResponse();
      //requestResponse.statusCode = statusCode;
      requestResponse.message = _handleDioError(e); //e.message;

      return requestResponse;
      //return _createDefaultGenericResponse(statusCode);
    }
  }

  Future<RegisterResponse> pushRegisterStudent(Register register) async {
    int? statusCode;
    try {
      //print("student registration request payload: $cashAdvanceRequest");
      Response response = await doPostRequest(registerEndpoint, register);
      statusCode = response.statusCode;

      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.toString());

        var requestResponse = RegisterResponse.fromJson(decodedBody);
        requestResponse.statusCode = statusCode!;

        return requestResponse;
      } else {
        var requestResponse = RegisterResponse();
        requestResponse.statusCode = statusCode!;
        requestResponse.message = response.statusMessage;

        return requestResponse;
        //return _createDefaultGenericResponse(statusCode);
      }
    } on DioException catch (e) {
      var requestResponse = RegisterResponse();
      //requestResponse.statusCode = statusCode!;
      requestResponse.message = _handleDioError(e); //e.message;

      return requestResponse;
    }
  }

  Future<GenericResponse> pushSubmitApplication(
      SubmitApplication application) async {
    int? statusCode;
    try {
      var formData = FormData.fromMap(application.toJson());
      List<MapEntry<String, MultipartFile>> images = [];

      if (application.photo != null && application.photo!.isNotEmpty) {
        images.add(
          MapEntry(
            'photo',
            await MultipartFile.fromFile(application.photo!,
                filename: basename(application.photo!)),
          ),
        );
      }

      if (application.document != null && application.document!.isNotEmpty) {
        images.add(
          MapEntry(
            'document',
            await MultipartFile.fromFile(application.document!,
                filename: basename(application.document!)),
          ),
        );
      }

      log("normal cooperative payload: ${formData.fields}");

      formData.files.addAll(images);
      log("application submission request payload: $application");
      Response response =
          await doPostRequestAuth(submitApplication, application);
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

  Future<ProgrammeResponse> pushSubmitProgram(
      ApplicationFormData formData) async {
    int? statusCode;
    try {
      Map<String, dynamic> data = {
        "programme": formData.programme,
      };
      Response response = await doPostRequestAuth(applicationFormData, data);
      statusCode = response.statusCode;

      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.toString());

        var requestResponse = ProgrammeResponse.fromJson(decodedBody);
        requestResponse.statusCode = statusCode!;

        return requestResponse;
      } else {
        var requestResponse = ProgrammeResponse();
        requestResponse.statusCode = statusCode!;
        requestResponse.message = response.statusMessage;

        return requestResponse;
        //return _createDefaultGenericResponse(statusCode);
      }
    } on DioException catch (e) {
      var requestResponse = ProgrammeResponse();
      //requestResponse.statusCode = statusCode!;
      requestResponse.message = _handleDioError(e); //e.message;

      return requestResponse;
    }
  }

  Future<CountryResponse> getCountryList({String? endpoint}) async {
    int? statusCode;
    try {
      Response response = await doGetRequest(countries);
      statusCode = response.statusCode;
      //print("state response: ${response.toString()}");

      if (_isConnectionSuccessful(statusCode)) {
        var decodedBody = jsonDecode(response.toString());

        var requestResponse = CountryResponse.fromJson(decodedBody);
        requestResponse.statusCode = statusCode!;
        return requestResponse;
      } else {
        var requestResponse = CountryResponse();
        requestResponse.statusCode = statusCode!;
        return requestResponse;
      }
    } on DioException catch (e) {
      var requestResponse = CountryResponse();
      //requestResponse.statusCode = statusCode ?? e.response.statusCode;
      requestResponse.message = _handleDioError(e);

      return requestResponse;
    }
  }

  Future<GenericResponse> getCourseDetails({String? endpoint}) async {
    int? statusCode;
    try {
      Response response = await doGetRequest(coursesEndpoint);
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

  Future<GenericResponse> getCourseVideo({String? endpoint}) async {
    int? statusCode;
    try {
      Response response = await doGetRequest(courseVideoEndpoint);
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

  Future<GenericResponse> getCourseDocument({String? endpoint}) async {
    int? statusCode;
    try {
      Response response = await doGetRequest(courseDocumentEndpoint);
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

  Future<GenericResponse> getCourseAudio({String? endpoint}) async {
    int? statusCode;
    try {
      Response response = await doGetRequest(courseAudioEndpoint);
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

  Future<GenericResponse> getCoursesList({String? endpoint}) async {
    int? statusCode;
    try {
      Response response = await doGetRequest(coursesEndpoint);
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

  Future<GenericResponse> getPaymentType({String? endpoint}) async {
    int? statusCode;
    try {
      Response response = await doGetRequest(paymentTypes);
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

  Future<GenericResponse> getPaymentHistory({String? endpoint}) async {
    int? statusCode;
    try {
      Response response = await doGetRequest(getPaymentHistoryEndpoint);
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

  Future<EmailVerification> verifyEmail(
      {String? endpoint, required String pin, required String email}) async {
    int? statusCode;
    Map<String, dynamic> body = {};
    body["pin"] = pin;
    body["email"] = email;

    try {
      // print("Hello ");
      Response response = await doPostRequest(verifyEmailEndpoint, body);
      // print("Hello 1");
      statusCode = response.statusCode;
      // print("state response: ${response.toString()}");

      if (_isConnectionSuccessful(statusCode)) {
        //print("Hello ");
        var decodedBody = jsonDecode(response.toString());

        var requestResponse = EmailVerification.fromJson(decodedBody['data']);

        requestResponse.statusCode = statusCode!;
        return requestResponse;
      } else {
        var requestResponse = EmailVerification();
        requestResponse.statusCode = statusCode!;
        return requestResponse;
      }
    } on DioException catch (e) {
      var requestResponse = EmailVerification();
      //requestResponse.statusCode = statusCode ?? e.response.statusCode;
      requestResponse.message = _handleDioError(e);

      return requestResponse;
    }
  }

  Future<GenericResponse> verifyScratchCard(
      {String? endpoint, required String pin}) async {
    int? statusCode;
    Map<String, dynamic> body = {};
    body["pin"] = pin;

    try {
      Response response =
          await doPostRequestAuth(verifyScratchCardPinEndpoint, body);
      statusCode = response.statusCode;

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

  Future<GenericResponse> resendEmailVerification(
      {String? endpoint, required String email}) async {
    int? statusCode;
    Map<String, dynamic> body = {};
    body['email'] = email;
    try {
      Response response =
          await doPostRequest(resendEmailVerificationEndpoint, body);
      statusCode = response.statusCode;
      //log("state response: ${response.toString()}");

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

/// Get token header for normal GET-POST requests.
Future<Map<String, String>> _getTokenHeader() async {
  var header = <String, String>{};
  header["Content-Type"] = "application/json";
  String? token = await getToken();
  print("Token value here : $token");

  if (token.isNotEmpty) {
    header["Authorization"] = "Bearer $token";
  }
  header["Connection"] = "close";
  header["Accept"] = "application/json";
  return header;
}

/// Get header for normal GET-POST requests.
Future<Map<String, String>> _getNormalHeader() async {
  var header = <String, String>{};
  header["Content-Type"] = "application/json";
  header["Connection"] = "close";
  header["Accept"] = "application/json";

  return header;
}

Future<Response> doPostRequestAuth(String endPoint, dynamic body) async {
  var header = await _getTokenHeader();
  //print("headers: $header");

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
  dio.options.connectTimeout = const Duration(minutes: 1); //30s
  dio.options.receiveTimeout = const Duration(minutes: 1); // 2 min

  return dio.post(endPoint,
      data: jsonEncode(body), options: Options(headers: header));
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
  dio.options.connectTimeout = const Duration(minutes: 1); //30s
  dio.options.receiveTimeout = const Duration(minutes: 1); // 2 min
  return dio.get(endPoint);
}

Future<Response> doPostRequest(endPoint, dynamic body) async {
  endPoint = endPoint.replaceAll("*", "");
  var header = await _getNormalHeader();
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
  dio.options.connectTimeout = const Duration(minutes: 1); //30s
  dio.options.receiveTimeout = const Duration(minutes: 1); // 2 min

  // return dio.post(endPoint,
  //     data: jsonEncode(body), options: Options(headers: header));

  // Response response =
  //     Response(requestOptions: RequestOptions(method: "post", path: endPoint));
  // try {
  //   response = await dio.post(endPoint,
  //       data: jsonEncode(body), options: Options(headers: header));
  // } on DioException catch (e) {
  //   response.statusMessage =
  //       (e.response?.statusCode ?? 500).toString().startsWith("5")
  //           ? "something_went_wrong_and_your_request_could_not_be_completed"
  //           : e.response?.data['message'];
  //   response.statusCode = e.response?.statusCode ?? 500;
  // }

  // return response;
  return dio.post(endPoint,
      data: jsonEncode(body), options: Options(headers: header));
}

bool _isConnectionSuccessful(int? statusCode) =>
    statusCode == 200 || statusCode == 201;

Future<String> getToken() async => await AppPrefs().getToken();

_handleDioError(DioException error) {
  String errorDescription = "";
  if (error.response?.statusCode == 422) {
    return errorDescription =
        error.response?.data['message'] ?? "Bad response from the server.";
  }
  if (error.error != null && error.error is SocketException) {
    return "Connection to server failed due to internet connection.";
  }

  switch (error.type) {
    case DioExceptionType.cancel:
      errorDescription = "Request to server was cancelled.";
      break;
    case DioExceptionType.connectionTimeout:
      errorDescription = "Connection timeout with server.";
      break;
    case DioExceptionType.connectionError:
      errorDescription =
          "Connection to server failed due to internet connection.";
      break;
    case DioExceptionType.badCertificate:
      errorDescription = "Bad Certificate.";
      break;
    case DioExceptionType.badResponse:
      errorDescription = "Bad response from the server.";
      break;
    case DioExceptionType.receiveTimeout:
      errorDescription = "Receive timeout in connection with server.";
      break;
    case DioExceptionType.sendTimeout:
      errorDescription = "Send timeout in connection with server.";
      break;
    case DioExceptionType.unknown:
      errorDescription =
          "Something went wrong and your request could not be completed.";
      break;
  }
  return errorDescription;
}
