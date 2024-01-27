class UserData {
  String? name;
  String? email;
  String? phone;
  String? createdAt;

  UserData({this.name, this.email, this.phone, this.createdAt});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      createdAt: json["created_at"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "created_at": createdAt,
    };
  }
}
