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

  obj.message = json["content"];
  obj.date = json["created_at"];

  return obj;
}

Map<String, dynamic> _$NotificationssToJson(Notificationss obj) =>
    <String, dynamic>{
      "content": obj.message,
      "created_at": obj.date,
    };
