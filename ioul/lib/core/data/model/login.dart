import 'user.dart';

class Login {
  bool? success;
  String? message;
  UserData? user;
  String? token;
  String? password;
  String? username;
  String? error;
  String? deviceToken;
  int? responseCode = -700;
  int statusCode = 400;
  List<dynamic>? metadata;

  bool isValidationError() => message == "Invalid Credentials";
  String? fullName() => user!.name ?? '';
  String? level() => '${user!.level ?? ''} level,';
  String? department() => 'Department of ${user!.department ?? ''}';

  /// Returns 'true' if requests on the API throws error 113
  bool _isValidationError() =>
      responseCode == 103 ||
      responseCode == 107 ||
      responseCode == 108 ||
      responseCode == 105;

  /// Returns 'true' if connection to server is successful and 'false' otherwise.
  bool isConnectionSuccessful() => statusCode == 200 || statusCode == 201;
  bool isRequestSuccessful() => responseCode == 100 || responseCode == 309;
  bool hasSuccessResponseWithError() => responseCode == 309;

  /// returns the error message depending on the success of the connection or request
  String get responseMessage {
    //print("status code: $statusCode");
    if (isConnectionSuccessful()) {
      // connection is successful, hence, error has to do with API request
      if (_isValidationError()) {
        return getApiErrorMessage().replaceAll("non field errors:", "").trim();
      }

      if (hasSuccessResponseWithError()) {
        return getApiErrorMessage().replaceAll("non field errors:", "").trim();
      }
      return message ?? "";
    } else if (!isConnectionSuccessful()) {
      // connection is NOT successful, hence, returns connection error
      if (_isValidationError()) {
        return getApiErrorMessage().replaceAll("non field errors:", "").trim();
      }
      if (hasSuccessResponseWithError()) {
        return getApiErrorMessage().replaceAll("non field errors:", "").trim();
      }

      return getApiErrorMessage();
    } else {
      return getApiErrorMessage();
    }
  }

  String getApiErrorMessage() => _formatApiErrorMessage(error, message ?? "");

  Login(
      {this.success,
      this.message,
      this.user,
      this.token,
      this.metadata,
      this.password,
      this.deviceToken,
      this.username,
      this.responseCode});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      success: json["success"],
      message: json["message"],
      user: UserData.fromJson(json["data"]["user"]),
      token: json["data"]["token"],
      metadata: json["metadata"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "message": message,
      "data": {
        "user": user?.toJson(),
        "token": token,
      },
      "metadata": metadata,
    };
  }
}

String _formatApiErrorMessage(dynamic response, String message) {
  if (response != null && response.toString().trim().isNotEmpty) {
    return response
        .toString()
        .replaceAll("{", '')
        .replaceAll("}", '')
        .replaceAll("_", " ")
        .replaceAll("'", "")
        .replaceAll("\"", "")
        .replaceAll("[", '')
        .replaceAll("]", '')
        .replaceAll("non field errors:", "")
        .replaceAll("errors", "")
        .replaceAll("errors:", "")
        .replaceAll("data:", "")
        .trim();
  }
  return message
      .replaceAll("{", '')
      .replaceAll("}", '')
      .replaceAll("_", " ")
      .replaceAll("'", "")
      .replaceAll("\"", "")
      .replaceAll("[", '')
      .replaceAll("]", '')
      .replaceAll("non field errors:", "")
      .replaceAll("errors:", "")
      .replaceAll("data:", "")
      .trim();
}
