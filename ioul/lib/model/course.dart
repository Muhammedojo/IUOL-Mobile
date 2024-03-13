class Course {
  String? code;
  String? title;
  int? id;
  int? unit;

  Course();

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

Course _$CourseFromJson(Map<String, dynamic> json) {
  var obj = Course();

  obj.code = json["code"];
  obj.title = json["title"];
  obj.id = json["id"];
  obj.unit = json["units"];

  return obj;
}

Map<String, dynamic> _$CourseToJson(Course obj) => <String, dynamic>{
      "code": obj.code,
      "title": obj.title,
      "id": obj.id,
      "units": obj.unit,
    };
