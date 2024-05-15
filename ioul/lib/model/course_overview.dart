import 'package:ioul/model/model.dart';
import 'package:ioul/model/time_table.dart';

class CourseOverview {
  String? introduction;
  String? description;
  String? outline;
  List<Timetable>? timetable;

  CourseOverview();

  factory CourseOverview.fromJson(Map<String, dynamic> json) =>
      _$CourseOverviewFromJson(json);
  Map<String, dynamic> toJson() => _$CourseOverviewToJson(this);
}

CourseOverview _$CourseOverviewFromJson(Map<String, dynamic> json) {
  var obj = CourseOverview();

  obj.introduction = json["introduction"];
  obj.description = json["description"];
  obj.outline = json["outline"];

  List<Timetable>? timetableList = [];
  if (json.containsKey("timetable") && json["timetable"] is List) {
    var tlist = json["timetable"] as List;
    for (var item in tlist) {
      timetableList.add(Timetable.fromJson(item));
    }
  }
  obj.timetable = timetableList;

  return obj;
}

Map<String, dynamic> _$CourseOverviewToJson(CourseOverview obj) =>
    <String, dynamic>{
      "introduction": obj.introduction,
      "description": obj.description,
      "outline": obj.outline,
      "timetable": obj.timetable,
    };
