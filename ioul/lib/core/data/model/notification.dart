class Notificationss {
  String? message;
  String? date;

  Notificationss();

  factory Notificationss.fromJson(Map<String, dynamic> json) =>
      _$NotificationssFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationssToJson(this);
}

Notificationss _$NotificationssFromJson(Map<String, dynamic> json) {
  var obj = Notificationss();

  obj.message = json["message"];
  obj.date = json["date"];

  return obj;
}

Map<String, dynamic> _$NotificationssToJson(Notificationss obj) =>
    <String, dynamic>{
      "message": obj.message,
      "date": obj.date,
    };
