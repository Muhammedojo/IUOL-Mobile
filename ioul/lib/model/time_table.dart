class Timetable {
  String? title;
  String? link;
  String? endDate;
  String? startDate;
  int? id;
  int? courseId;

  Timetable();

  factory Timetable.fromJson(Map<String, dynamic> json) =>
      _$TimetableFromJson(json);
  Map<String, dynamic> toJson() => _$TimetableToJson(this);
}

Timetable _$TimetableFromJson(Map<String, dynamic> json) {
  var obj = Timetable();

  obj.id = json["id"];
  obj.courseId = json["course_id"];
  obj.startDate = json["start_date"];
  obj.endDate = json["end_date"];
  obj.title = json["title"];
  obj.link = json["link"];

  return obj;
}

Map<String, dynamic> _$TimetableToJson(Timetable obj) => <String, dynamic>{
      "id": obj.id,
      "course_id": obj.courseId,
      "start_date": obj.startDate,
      "end_date": obj.endDate,
      "title": obj.title,
      "link": obj.link,
    };
