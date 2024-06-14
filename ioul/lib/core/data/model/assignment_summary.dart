class AssignmentSummary {
  int? unit;
  String? courseTitle;
  int? studentAssignmentId;
  String? courseCode;

  AssignmentSummary();

  factory AssignmentSummary.fromJson(Map<String, dynamic> json) =>
      _$AssignmentSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$AssignmentSummaryToJson(this);
}

AssignmentSummary _$AssignmentSummaryFromJson(Map<String, dynamic> json) {
  var obj = AssignmentSummary();

  obj.courseCode = json["course_code"];
  obj.courseTitle = json["course_title"];
  obj.unit = json["semester_name"];
  obj.studentAssignmentId = json["resources_count"];

  return obj;
}

Map<String, dynamic> _$AssignmentSummaryToJson(AssignmentSummary obj) =>
    <String, dynamic>{
      "course_code": obj.courseCode,
      "course_title": obj.courseTitle,
      "units": obj.unit,
      "student_assignment_id": obj.studentAssignmentId,
    };
