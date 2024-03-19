class RegisteredCourses {
  int? id;
  int? admissionId;
  int? courseId;
  int? programmeLevelId;

  String? semester;
  int? sessionId;
  int? totalMarks;
  String? grade;
  int? releaseResult;
  String? createdAt;
  String? updatedAt;

  RegisteredCourses();

  factory RegisteredCourses.fromJson(Map<String, dynamic> json) =>
      _$RegisteredCoursesFromJson(json);
  Map<String, dynamic> toJson() => _$RegisteredCoursesToJson(this);
}

RegisteredCourses _$RegisteredCoursesFromJson(Map<String, dynamic> json) {
  var obj = RegisteredCourses();
  obj.id = json["id"];
  obj.admissionId = json["admission_id"];
  obj.courseId = json["course_id"];
  obj.programmeLevelId = json["programme_level_id"];
  obj.semester = json["semester"];
  obj.sessionId = json["session_id"];
  obj.totalMarks = json["total_marks"];
  obj.grade = json["grade"];
  obj.releaseResult = json["release_result"];
  obj.createdAt = json["created_at"];
  obj.updatedAt = json["updated_at"];

  return obj;
}

Map<String, dynamic> _$RegisteredCoursesToJson(RegisteredCourses obj) =>
    <String, dynamic>{
      "id": obj.id,
      "admission_id": obj.admissionId,
      "course_id": obj.courseId,
      "programme_level_id": obj.programmeLevelId,
      "semester": obj.semester,
      "session_id": obj.sessionId,
      "total_marks": obj.totalMarks,
      "grade": obj.grade,
      "release_result": obj.releaseResult,
      "created_at": obj.createdAt,
      "updated_at": obj.updatedAt,
    };
