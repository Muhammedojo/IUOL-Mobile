class Login {
  String? email;
  String? password;
  String? token;
  String? message;
  bool? success;
  String? responseCode = "-700";
  int statusCode = 400;

  bool isConnectionSuccessful() => statusCode == 200;
  bool isRequestSuccessful() => responseCode == "100";
  bool isValidationError() => message == "Invalid Credentials";
  Login(
      {this.email, this.password, this.token, this.responseCode, this.message});
  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

Login _$LoginFromJson(Map<String, dynamic> json) {
  var obj = Login();
  obj.email = json["email"];
  obj.password = json["password"];
  obj.token = json["token"];
  obj.message = json["message"];

  return obj;
}

Map<String, dynamic> _$LoginToJson(Login obj) => <String, dynamic>{
      "email": obj.email,
      "password": obj.password,
      "token": obj.token
    };
