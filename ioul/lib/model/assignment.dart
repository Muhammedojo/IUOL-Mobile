class Assignment {
  String? code;
  String? title;
  int? id;
  int? unit;

  Assignment();

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);
  Map<String, dynamic> toJson() => _$AssignmentToJson(this);
}

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  var obj = Assignment();

  obj.code = json["code"];
  obj.title = json["title"];
  obj.id = json["id"];
  obj.unit = json["units"];

  return obj;
}

Map<String, dynamic> _$AssignmentToJson(Assignment obj) => <String, dynamic>{
      "code": obj.code,
      "title": obj.title,
      "id": obj.id,
      "units": obj.unit,
    };
