import '../../core.dart';

class EnrolledCourseResponse {
  int? statusCode;
  String? message;
  List<Course>? enrolledCourse;

  EnrolledCourseResponse({
    this.statusCode,
    this.message,
    this.enrolledCourse,
  });

  factory EnrolledCourseResponse.fromJson(Map<String, dynamic> json) {
    return EnrolledCourseResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      enrolledCourse: (json['data']['enrolled_courses'] as List)
          .map((item) => Course.fromJson(item))
          .toList(),
    );
  }
}
