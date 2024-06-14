class Examinations {
  String? waec;
  String? neco;
  bool? nabteb;
  String? nbais;
  String? others;

  Examinations();

  factory Examinations.fromJson(Map<String, dynamic> json) =>
      _$ExaminationsFromJson(json);
  Map<String, dynamic> toJson() => _$ExaminationsToJson(this);
}

Examinations _$ExaminationsFromJson(Map<String, dynamic> json) {
  var obj = Examinations();
  obj.waec = json["WAEC"];
  obj.neco = json["NECO"];
  obj.nabteb = json["NABTEB"];
  obj.nbais = json["NBAIS"];
  obj.others = json["OTHERS"];

  return obj;
}

Map<String, dynamic> _$ExaminationsToJson(Examinations obj) =>
    <String, dynamic>{
      "WAEC": obj.waec,
    };
