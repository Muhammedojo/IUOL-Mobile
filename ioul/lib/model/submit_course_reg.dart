class SubmitCourseReg {
  String? semesterRegId;
  List<int>? courseIds;

  SubmitCourseReg();

  factory SubmitCourseReg.fromJson(Map<String, dynamic> json) =>
      _$SubmitCourseRegFromJson(json);
  Map<String, dynamic> toJson() => _$SubmitCourseRegToJson(this);
}

SubmitCourseReg _$SubmitCourseRegFromJson(Map<String, dynamic> json) {
  var obj = SubmitCourseReg();
  obj.semesterRegId = json["semester_reg_id"];

  List<int>? courseIdsList = [];
  var list = json["course_ids"] as List;
  for (var item in list) {
    courseIdsList.add(item);
  }
  obj.courseIds = courseIdsList;

  return obj;
}

Map<String, dynamic> _$SubmitCourseRegToJson(SubmitCourseReg obj) =>
    <String, dynamic>{
      "semester_reg_id": obj.semesterRegId,
      "course_ids": obj.courseIds,
    };
