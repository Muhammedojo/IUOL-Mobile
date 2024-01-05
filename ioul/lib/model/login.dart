import 'user.dart';

class Login {
  bool? success;
  String? message;
  UserData? user;
  String? token;
  String? responseCode = "-700";
  int statusCode = 400;
  List<dynamic>? metadata;

  bool isConnectionSuccessful() => statusCode == 200;
  bool isRequestSuccessful() => responseCode == "100";
  bool isValidationError() => message == "Invalid Credentials";

  Login(
      {this.success,
      this.message,
      this.user,
      this.token,
      this.metadata,
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
