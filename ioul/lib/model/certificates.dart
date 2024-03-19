class Certificates {
  String? ssce;
  String? nce;
  bool? ond;
  String? nd;
  String? bachelor;
  String? masters;
  String? phd;
  String? others;

  Certificates();

  factory Certificates.fromJson(Map<String, dynamic> json) =>
      _$CertificatesFromJson(json);
  Map<String, dynamic> toJson() => _$CertificatesToJson(this);
}

Certificates _$CertificatesFromJson(Map<String, dynamic> json) {
  var obj = Certificates();
  obj.ssce = json["SSCE"];
  obj.nce = json["NCE"];
  obj.ond = json["OND"];
  obj.nd = json["ND"];
  obj.bachelor = json["Bachelor"];
  obj.masters = json["Masters"];
  obj.phd = json["PhD"];
  obj.others = json["OTHERS"];

  return obj;
}

Map<String, dynamic> _$CertificatesToJson(Certificates obj) =>
    <String, dynamic>{
      "PhD": obj.phd,
    };
