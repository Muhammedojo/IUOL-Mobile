class UserData {
  String? name;
  String? email;
  bool? hasApplication;
  String? phone;
  String? createdAt;

  UserData(
      {this.name, this.email, this.phone, this.createdAt, this.hasApplication});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      hasApplication: json["has_application"],
      createdAt: json["created_at"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "has_application": hasApplication,
      "created_at": createdAt,
    };
  }
}
