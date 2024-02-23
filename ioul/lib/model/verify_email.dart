import 'package:ioul/model/user.dart';

class EmailVerification {
  String? pin;
  String? email;
  UserData? user;
  String? token;
  int? statusCode;
  String? message;
  EmailVerification({
    this.pin,
    this.email,
    this.user,
    this.token,
    this.statusCode,
    this.message,
  });

  factory EmailVerification.fromJson(Map<String, dynamic> json) {
    return EmailVerification(
      user: UserData.fromJson(json['user']),
      token: json['token'],
      // responseCode: json['response']
    );
  }

  
}
