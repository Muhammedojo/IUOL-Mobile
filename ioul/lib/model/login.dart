import 'user.dart';

class LoginData {
  bool? success;
  String? message;
  String? email;
  String? password;
  UserData? user;
  String? token;

  LoginData(
      {this.success,
      this.message,
      this.user,
      this.token,
      this.email,
      this.password});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      success: json["success"],
      message: json["message"],
      user: UserData.fromJson(json["user"]),
      token: json["token"],
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
    };
  }
}
