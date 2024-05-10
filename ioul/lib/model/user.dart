class UserData {
  String? name;
  String? email;
  bool? hasApplication;
  bool? isAdmitted;
  String? phone;
  String? createdAt;

  UserData(
      {this.name,
      this.email,
      this.phone,
      this.createdAt,
      this.hasApplication,
      this.isAdmitted});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      hasApplication: json["has_application"],
      isAdmitted: json["is_admitted"],
      createdAt: json["created_at"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "is_admitted": isAdmitted,
      "has_application": hasApplication,
      "created_at": createdAt,
    };
  }
}
