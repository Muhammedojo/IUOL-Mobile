class CourseSummary {
  String? courseCode;
  String? courseTitle;
  String? semesterName;
  String? assignmentCount;
  int? resourcesCount;
  String? reportCount;

  CourseSummary();

  factory CourseSummary.fromJson(Map<String, dynamic> json) =>
      _$CourseSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$CourseSummaryToJson(this);
}

CourseSummary _$CourseSummaryFromJson(Map<String, dynamic> json) {
  var obj = CourseSummary();

  obj.courseCode = json["course_code"];
  obj.courseTitle = json["course_title"];
  obj.semesterName = json["semester_name"];
  obj.resourcesCount = json["resources_count"];
  obj.assignmentCount = json["assignments_count"];
  obj.reportCount = json["reports_count"];

  return obj;
}

Map<String, dynamic> _$CourseSummaryToJson(CourseSummary obj) =>
    <String, dynamic>{
      "course_code": obj.courseCode,
      "course_title": obj.courseTitle,
      "semester_name": obj.semesterName,
      "resources_count": obj.resourcesCount,
      "assignments_count": obj.assignmentCount,
      "reports_count": obj.reportCount,
    };
