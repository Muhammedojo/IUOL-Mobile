import 'course_detail.dart';
import 'course_summary.dart';

class Course {
  String? courseCode;
  String? courseTitle;
  int? studentCourseId;
  int? unit;
  CourseDetails? courseDetails;
  CourseSummary? courseSummary;

  //  "student_course_id": 3,
  //               "course_code": "HBP941",
  //               "course_title": "Sint qui dolore hic.",
  //               "units": 1,
  // course_details
  //course_summary

  Course();

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

Course _$CourseFromJson(Map<String, dynamic> json) {
  var obj = Course();

  obj.courseCode = json["course_code"];
  obj.courseTitle = json["course_title"];
  obj.studentCourseId = json["student_course_id"];
  obj.unit = json["units"];
  if (json.containsKey('course_summary')) {
    if (json['course_summary'] == null) {
      obj.courseSummary = json['course_summary'];
    } else {
      obj.courseSummary = CourseSummary.fromJson(json['course_summary']);
    }
  }
  if (json.containsKey('course_details')) {
    if (json['course_details'] == null) {
      obj.courseDetails = json['course_details'];
    } else {
      obj.courseDetails = CourseDetails.fromJson(json['course_details']);
    }
  }

  return obj;
}

Map<String, dynamic> _$CourseToJson(Course obj) => <String, dynamic>{
      "course_code": obj.courseCode,
      "course_title": obj.courseTitle,
      "student_course_id": obj.studentCourseId,
      "units": obj.unit,
      "course_summary": obj.courseSummary,
      "course_details": obj.courseDetails
    };
