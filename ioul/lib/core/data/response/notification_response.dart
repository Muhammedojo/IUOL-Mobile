import '../../core.dart';

class NotificationResponse {
  int? statusCode;
  String? message;
  List<Notificationss>? notifications;

  NotificationResponse({
    this.statusCode,
    this.message,
    this.notifications,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      notifications: (json['data']['notifications'] as List)
          .map((item) => Notificationss.fromJson(item))
          .toList(),
    );
  }
}
