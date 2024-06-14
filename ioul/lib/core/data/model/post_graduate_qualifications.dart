class PostGraduateQualifications {
  String? ssce;
  String? nce;
  bool? ond;
  String? nd;
  String? others;
  String? bachelor;
  String? masters;
  String? phd;

  PostGraduateQualifications();

  factory PostGraduateQualifications.fromJson(Map<String, dynamic> json) =>
      _$PostGraduateQualificationsFromJson(json);
  Map<String, dynamic> toJson() => _$PostGraduateQualificationsToJson(this);
}

PostGraduateQualifications _$PostGraduateQualificationsFromJson(
    Map<String, dynamic> json) {
  var obj = PostGraduateQualifications();
  obj.ssce = json["SSCE"];
  obj.nce = json["NCE"];
  obj.ond = json["OND"];
  obj.bachelor = json["Bachelor"];
  obj.masters = json["Masters"];
  obj.phd = json["PhD"];

  obj.others = json["OTHERS"];

  return obj;
}

Map<String, dynamic> _$PostGraduateQualificationsToJson(
        PostGraduateQualifications obj) =>
    <String, dynamic>{
      "OTHERS": obj.others,
    };
