import '../../core.dart';

class UpcomingAssignmentResponse {
  int? statusCode;
  String? message;
  List<UpcomingTask>? upcomingAssignment;

  UpcomingAssignmentResponse({
    this.statusCode,
    this.message,
    this.upcomingAssignment,
  });

  factory UpcomingAssignmentResponse.fromJson(Map<String, dynamic> json) {
    return UpcomingAssignmentResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      upcomingAssignment: (json['data']['upcoming_assignments'] as List)
          .map((item) => UpcomingTask.fromJson(item))
          .toList(),
    );
  }
}
