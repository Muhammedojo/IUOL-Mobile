class GenericResponse {
  GenericResponse({this.success, this.message, this.data});

  int? responseCode = -700;

  String? message;
  bool? success;
  final Object? data;
  String? error;

  String? detail;

  int? statusCode = 400; //bad request error

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
      //  print("alrighty...");
      // connection is NOT successful, hence, returns connection error
      if (_isValidationError()) {
        return getApiErrorMessage().replaceAll("non field errors:", "").trim();
      }
      if (hasSuccessResponseWithError()) {
        return getApiErrorMessage().replaceAll("non field errors:", "").trim();
      }
      // print("hala... ");
      return getApiErrorMessage();
    } else {
      // print("holla ....");
      // every went well.
      return getApiErrorMessage();
    }
  }

  factory GenericResponse.fromJson(Map<String, dynamic> json) =>
      _$GenericResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GenericResponseToJson(this);

  String getApiErrorMessage() => _formatApiErrorMessage(error, message ?? "");

//Validation Error
}

GenericResponse _$GenericResponseFromJson(Map<String, dynamic> json) {
  var obj = GenericResponse();

  if (json.containsKey("message")) {
    obj.message = json["message"];
  }
  if (json.containsKey("data")) {
    // obj.data = json[''];
  }

  return obj;
}

Map<String, dynamic> _$GenericResponseToJson(GenericResponse obj) =>
    <String, dynamic>{
      // KEY_MESSAGE: obj.message,
    };

String _formatApiErrorMessage(dynamic response, String message) {
  //print("response: $response, message: $message");
  if (response != null && response.toString().trim().isNotEmpty) {
    return response
        .toString()
        .replaceAll("{", '')
        .replaceAll("}", '')
        .replaceAll("_", " ")
        .replaceAll("\'", "")
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
      .replaceAll("\'", "")
      .replaceAll("\"", "")
      .replaceAll("[", '')
      .replaceAll("]", '')
      .replaceAll("non field errors:", "")
      .replaceAll("errors:", "")
      .replaceAll("data:", "")
      .trim();
}
