class Report {
  String? code;
  String? title;
  int? id;
  int? unit;

  Report();

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

Report _$ReportFromJson(Map<String, dynamic> json) {
  var obj = Report();

  obj.code = json["code"];
  obj.title = json["title"];
  obj.id = json["id"];
  obj.unit = json["units"];

  return obj;
}

Map<String, dynamic> _$ReportToJson(Report obj) => <String, dynamic>{
      "code": obj.code,
      "title": obj.title,
      "id": obj.id,
      "units": obj.unit,
    };
