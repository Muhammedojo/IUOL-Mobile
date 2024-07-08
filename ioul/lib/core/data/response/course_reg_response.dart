import '../../core.dart';

class CourseRegResponse {
  int? statusCode;
  String? message;
  Unit? units;
  int? studentRegID;
  List<SummaryCourse>? failedCourses;
  List<SummaryCourse>? registeredCourses;
  List<SummaryCourse>? availableCourses;

  CourseRegResponse({
    this.statusCode,
    this.message,
    this.units,
    this.studentRegID,
    this.failedCourses,
    this.registeredCourses,
    this.availableCourses,
  });

  factory CourseRegResponse.fromJson(Map<String, dynamic> json) {
    return CourseRegResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      units: json['data']['units'] != null
          ? Unit.fromJson(json['data']['units'])
          : null,
      studentRegID: json['data']['student_registration_id'],
      failedCourses: (json['data']['failed_courses'] as List)
          .map((item) => SummaryCourse.fromJson(item))
          .toList(),
      registeredCourses: (json['data']['registered_courses'] as List)
          .map((item) => SummaryCourse.fromJson(item))
          .toList(),
      availableCourses: (json['data']['available_courses'] as List)
          .map((item) => SummaryCourse.fromJson(item))
          .toList(),
    );
  }
}
