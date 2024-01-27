class Register {
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? phone;
  Register();

  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}

Register _$RegisterFromJson(Map<String, dynamic> json) {
  var obj = Register();
  obj.email = json["email"];
  obj.passwordConfirmation = json["password_confirmation"];
  obj.phone = json["phone"];
  obj.firstName = json["first_name"];
  obj.lastName = json["last_name"];
  obj.middleName = json["middle_name"];
  obj.password = json["password"];

  return obj;
}

Map<String, dynamic> _$RegisterToJson(Register obj) => <String, dynamic>{
      "email": obj.email,
      "password": obj.password,
      "password_confirmation": obj.passwordConfirmation,
      "phone": obj.phone,
      "first_name": obj.firstName,
      "last_name": obj.lastName,
      "middle_name": obj.middleName,
    };