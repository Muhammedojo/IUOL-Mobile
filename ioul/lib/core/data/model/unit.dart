class Unit {
  int? max;
  int? min;
  int? id;
  int? programmeLevelId;
  String? semester;
  String? createdAt;
  String? updatedAt;

  Unit();

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
  Map<String, dynamic> toJson() => _$UnitToJson(this);
}

Unit _$UnitFromJson(Map<String, dynamic> json) {
  var obj = Unit();

  obj.min = json["min"];
  obj.max = json["max"];
  obj.id = json["id"];
  obj.programmeLevelId = json["programme_level_id"];
  obj.semester = json["semester"];
  obj.createdAt = json["created_at"];
  obj.updatedAt = json["updated_at"];

  return obj;
}

Map<String, dynamic> _$UnitToJson(Unit obj) => <String, dynamic>{
      "min": obj.min,
      "max": obj.max,
      "id": obj.id,
      "created_at": obj.createdAt,
      "updated_at": obj.updatedAt,
      "semester": obj.semester,
      "programme_level_id": obj.programmeLevelId,
    };
