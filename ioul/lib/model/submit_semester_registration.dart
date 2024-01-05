class SubmitSemesterRegistration {
  String? programmeLevelId;
  String? semester;
  String? sessionId;
  String? studyCenterId;

  SubmitSemesterRegistration();

  factory SubmitSemesterRegistration.fromJson(Map<String, dynamic> json) =>
      _$SubmitSemesterRegistrationFromJson(json);
  Map<String, dynamic> toJson() => _$SubmitSemesterRegistrationToJson(this);
}

SubmitSemesterRegistration _$SubmitSemesterRegistrationFromJson(
    Map<String, dynamic> json) {
  var obj = SubmitSemesterRegistration();
  obj.programmeLevelId = json["programme_level_id"];
  obj.semester = json["semester"];
  obj.sessionId = json["session_id"];
  obj.studyCenterId = json["study_center_id"];

  return obj;
}

Map<String, dynamic> _$SubmitSemesterRegistrationToJson(
        SubmitSemesterRegistration obj) =>
    <String, dynamic>{
      "programme_level_id": obj.programmeLevelId,
      "semester": obj.semester,
      "session_id": obj.sessionId,
      "study_center_id": obj.studyCenterId,
    };
