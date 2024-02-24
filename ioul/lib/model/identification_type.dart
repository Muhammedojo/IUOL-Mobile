class IdentificationTypes {
  String? nic;
  String? internationPassport;
  bool? votersCard;
  String? driversLicence;
  String? indegeneCertificate;

  IdentificationTypes();

  factory IdentificationTypes.fromJson(Map<String, dynamic> json) =>
      _$IdentificationTypesFromJson(json);
  Map<String, dynamic> toJson() => _$IdentificationTypesToJson(this);
}

IdentificationTypes _$IdentificationTypesFromJson(Map<String, dynamic> json) {
  var obj = IdentificationTypes();
  obj.nic = json["National Identity Card"];
  obj.internationPassport = json["International Passport"];
  obj.votersCard = json["Voters Card"];
  obj.driversLicence = json["Drivers Licence"];
  obj.indegeneCertificate = json["Indegene Certificate"];

  return obj;
}

Map<String, dynamic> _$IdentificationTypesToJson(IdentificationTypes obj) =>
    <String, dynamic>{
      "National Identity Card": obj.nic,
    };
