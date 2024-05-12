import 'package:ioul/model/course.dart';
import 'package:ioul/model/unit.dart';

class CourseRegResponse {
  int? statusCode;
  String? message;
  Unit? units;
  int? studentRegID;
  List<Course>? failedCourses;
  List<Course>? registeredCourses;
  List<Course>? availableCourses;

  CourseRegResponse(
      {this.availableCourses,
      this.failedCourses,
      this.message,
      this.studentRegID,
      this.registeredCourses,
      this.statusCode,
      this.units});

  factory CourseRegResponse.fromJson(Map<String, dynamic> json) {
    List<Course> failedCoursesData = [];
    for (var item in json['data']['failed_courses'].values) {
      failedCoursesData.add(item);
    }
    List<Course> registeredCoursesData = [];
    for (var item in json['data']['registered_courses'].values) {
      registeredCoursesData.add(item);
    }
    List<Course> availableCoursesData = [];
    for (var item in json['data']['available_courses'].values) {
      availableCoursesData.add(item);
    }
    return CourseRegResponse(
      units: json['unit'],
      studentRegID: json['student_registration_id'],
      failedCourses: failedCoursesData,
      registeredCourses: registeredCoursesData,
      availableCourses: availableCoursesData,
      message: json['message'],
    );
  }
}
