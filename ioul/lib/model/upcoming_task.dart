class UpcomingTask {
  String? courseCode;
  String? courseTitle;
  String? dueDate;

  UpcomingTask();

  factory UpcomingTask.fromJson(Map<String, dynamic> json) =>
      _$UpcomingTaskFromJson(json);
  Map<String, dynamic> toJson() => _$UpcomingTaskToJson(this);
}

UpcomingTask _$UpcomingTaskFromJson(Map<String, dynamic> json) {
  var obj = UpcomingTask();

  obj.courseCode = json["course_code"];
  obj.courseTitle = json["course_title"];
  obj.dueDate = json["due_date"];

  return obj;
}

Map<String, dynamic> _$UpcomingTaskToJson(UpcomingTask obj) =>
    <String, dynamic>{
      "course_code": obj.courseCode,
      "course_title": obj.courseTitle,
      "due_date": obj.dueDate,
    };
