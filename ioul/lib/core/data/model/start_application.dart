class StartApplication {
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? phone;
  StartApplication();

  factory StartApplication.fromJson(Map<String, dynamic> json) =>
      _$StartApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$StartApplicationToJson(this);
}

StartApplication _$StartApplicationFromJson(Map<String, dynamic> json) {
  var obj = StartApplication();
  obj.email = json["email"];
  obj.passwordConfirmation = json["password_confirmation"];
  obj.phone = json["phone"];
  obj.firstName = json["first_name"];
  obj.lastName = json["last_name"];
  obj.middleName = json["middle_name"];
  obj.password = json["password"];

  return obj;
}

Map<String, dynamic> _$StartApplicationToJson(StartApplication obj) =>
    <String, dynamic>{
      "email": obj.email,
      "password": obj.password,
      "password_confirmation": obj.passwordConfirmation,
      "phone": obj.phone,
      "first_name": obj.firstName,
      "last_name": obj.lastName,
      "middle_name": obj.middleName,
    };
