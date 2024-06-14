class GetCoursesForRegistration {
  String? semesterRegId;

  GetCoursesForRegistration();

  factory GetCoursesForRegistration.fromJson(Map<String, dynamic> json) =>
      _$GetCoursesForRegistrationFromJson(json);
  Map<String, dynamic> toJson() => _$GetCoursesForRegistrationToJson(this);
}

GetCoursesForRegistration _$GetCoursesForRegistrationFromJson(
    Map<String, dynamic> json) {
  var obj = GetCoursesForRegistration();
  obj.semesterRegId = json["semester_reg_id"];

  return obj;
}

Map<String, dynamic> _$GetCoursesForRegistrationToJson(
        GetCoursesForRegistration obj) =>
    <String, dynamic>{
      "semester_reg_id": obj.semesterRegId,
    };
