import 'package:ioul/model/model.dart';

class CourseDetails {
  int? studentCourseId;
  String? courseCode;
  String? courseTitle;
  int? unit;
  CourseOverview? overview;
  Resources? resources;

  CourseDetails();

  factory CourseDetails.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CourseDetailsToJson(this);
}

CourseDetails _$CourseDetailsFromJson(Map<String, dynamic> json) {
  var obj = CourseDetails();

  obj.studentCourseId = json["introduction"];
  obj.courseCode = json["description"];
  obj.courseTitle = json["outline"];
  obj.unit = json['units'];

  if (json.containsKey('overview')) {
    if (json['overview'] == null) {
      obj.overview = json['overview'];
    } else {
      obj.overview = CourseOverview.fromJson(json['overview']);
    }
  }
  if (json.containsKey('resources')) {
    if (json['resources'] == null) {
      obj.resources = json['resources'];
    } else {
      obj.resources = Resources.fromJson(json['resources']);
    }
  }

  return obj;
}

Map<String, dynamic> _$CourseDetailsToJson(CourseDetails obj) =>
    <String, dynamic>{
      "course_title": obj.courseTitle,
      "course_code": obj.courseCode,
      "student_course_id": obj.studentCourseId,
      "units": obj.unit,
      "overview": obj.overview,
      "resources": obj.resources,
    };
