import 'package:ioul/packages/package.dart';
import 'package:path/path.dart';

class SubmitApplication {
  String? dob;
  String? address;
  String? photo;
  String? document;
  String? levelApplyingFor;
  String? qualificationApplyingWith;
  String? programmeApplyingFor;
  String? highestQualificationObtained;
  String? referral;
  String? referralDetails;
  String? refereeName;
  String? refereePhone;
  String? refereeEmail;
  String? refereeAddress;
  String? gender;
  String? religion;
  String? language;
  String? maritalStatus;
  String? occupation;
  String? identificationType;
  String? identificationNumber;
  String? sponsorType;
  String? sponsorName;
  String? sponsorAddress;
  String? nokName;
  String? nokPhone;
  String? nokEmail;
  String? nokAddress;
  String? spouseName;
  String? spousePhone;
  String? spouseEmail;
  String? spouseAddress;
  String? residentialAddress;
  String? permanentAddress;
  String? workAddress;
  String? referralType;
  String? referralDescription;
  int? nationalityId;
  int? stateId;
  String? lgaId;
  String? lga;
  int? residenceCountryId;
  int? residenceStateId;
  String? ssceOne;
  String? candidateExamNumber;
  String? examCenterName;
  String? examCenterNumber;
  String? examYear;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? phone;
  SubmitApplication();

  factory SubmitApplication.fromJson(Map<String, dynamic> json) =>
      _$SubmitApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitApplicationToJson(this);
  Future<FormData> toFormData() async => _$SubmitApplicationToFormData(this);
}

SubmitApplication _$SubmitApplicationFromJson(Map<String, dynamic> json) {
  var obj = SubmitApplication();
  obj.dob = json['dob'];
  obj.address = json['address'];
  obj.photo = json['photo'];
  obj.document = json['document'];
  obj.levelApplyingFor = json['level_applying_for'];
  obj.qualificationApplyingWith = json['qualification_applying_with'];
  obj.programmeApplyingFor = json['programme_applying_for'];
  obj.highestQualificationObtained = json['highest_qualification_obtained'];
  obj.referral = json['referral'];
  obj.referralDetails = json['referral_details'];
  obj.gender = json['gender'];
  obj.religion = json['religion'];
  obj.language = json['language'];
  obj.maritalStatus = json['marital_status'];
  obj.occupation = json['occupation'];
  obj.identificationType = json['identification_type'];
  obj.identificationNumber = json['identification_number'];
  obj.sponsorType = json['sponsor_type'];
  obj.sponsorAddress = json['sponsor_address'];
  obj.sponsorName = json['sponsor_name'];
  obj.email = json["email"];
  obj.phone = json["phone"];
  obj.firstName = json["first_name"];
  obj.lastName = json["surname"];
  obj.middleName = json["middle_name"];
  obj.candidateExamNumber = json['candidate_exam_number_1'];
  obj.ssceOne = json['ssce_1'];
  obj.residenceStateId = json['residence_state_id'];
  obj.lgaId = json['lga_id'];
  obj.stateId = json['state_id'];
  obj.spouseEmail = json['spouse_email'];
  obj.spousePhone = json['spouse_phone'];
  obj.sponsorName = json['spouse_name'];
  obj.nokAddress = json['next_of_kin_address'];
  obj.refereeEmail = json['referee_email'];
  obj.refereePhone = json['referee_phone'];
  obj.refereeName = json['referee_name'];
  obj.refereeAddress = json['referee_address'];
  obj.nokName = json['next_of_kin_name'];
  obj.nokEmail = json['next_of_kin_email'];
  obj.nokPhone = json['next_of_kin_phone'];
  obj.residentialAddress = json['residential_address'];
  obj.permanentAddress = json['permanent_address'];
  obj.sponsorAddress = json['spouse_address'];
  obj.workAddress = json['work_address'];
  obj.nationalityId = json['nationality_id'];
  obj.referralDescription = json['referral_description'];
  obj.referralType = json['referral_type'];
  obj.lga = json['local_government_area'];
  obj.residenceCountryId = json['residence_country_id'];
  obj.examCenterName = json['exam_center_name_1'];
  obj.examCenterNumber = json['exam_center_number_1'];
  obj.examYear = json['exam_year_1'];

  return obj;
}

Map<String, dynamic> _$SubmitApplicationToJson(SubmitApplication obj) =>
    <String, dynamic>{
      "first_name": obj.firstName,
      "surname": obj.lastName,
      "middle_name": obj.middleName,
      "dob": obj.dob,
      "email": obj.email,
      "phone": obj.phone,
      "address": obj.address,
      "level_applying_for": obj.levelApplyingFor,
      "qualification_applying_with": obj.qualificationApplyingWith,
      "programme_applying_for": obj.programmeApplyingFor,
      "highest_qualification_obtained": obj.highestQualificationObtained,
      "referral": obj.referral,
      "referral_details": obj.referralDetails,
      "gender": obj.gender,
      "religion": obj.religion,
      "language": obj.language,
      "marital_status": obj.maritalStatus,
      "occupation": obj.occupation,
      "identification_type": obj.identificationType,
      "identification_number": obj.identificationNumber,
      "sponsor_type": obj.sponsorType,
      "sponsor_name": obj.sponsorName,
      "sponsor_address": obj.sponsorAddress,
      "referee_name": obj.refereeName,
      "referee_phone": obj.refereePhone,
      "referee_email": obj.refereeEmail,
      "referee_address": obj.refereeAddress,
      "next_of_kin_name": obj.nokName,
      "next_of_kin_phone": obj.nokPhone,
      "next_of_kin_email": obj.nokEmail,
      "next_of_kin_address": obj.nokAddress,
      "spouse_name": obj.spouseName,
      "spouse_phone": obj.spousePhone,
      "spouse_email": obj.spouseEmail,
      "spouse_address": obj.spouseAddress,
      "residential_address": obj.residentialAddress,
      "permanent_address": obj.permanentAddress,
      "work_address": obj.workAddress,
      "referral_type": obj.referralType,
      "referral_description": obj.referralDescription,
      "nationality_id": obj.nationalityId,
      "state_id": obj.stateId,
      "lga_id": obj.lgaId,
      "local_government_area": obj.lga,
      "residence_country_id": obj.residenceCountryId,
      "residence_state_id": obj.residenceStateId,
      "ssce_1": obj.ssceOne,
      "candidate_exam_number_1": obj.candidateExamNumber,
      "exam_center_name_1": obj.examCenterName,
      "exam_center_number_1": obj.examCenterNumber,
      "exam_year_1": obj.examYear
    };

Future<FormData> _$SubmitApplicationToFormData(SubmitApplication obj) async {
  MultipartFile passportMultipartFile = await MultipartFile.fromFile(
    obj.photo!,
    filename: basename(obj.photo!),
  );
  MultipartFile documentMultipartFile = await MultipartFile.fromFile(
    obj.document!,
    filename: basename(obj.document!),
  );
  return FormData.fromMap({
    "first_name": obj.firstName,
    "surname": obj.lastName,
    "middle_name": obj.middleName,
    "dob": obj.dob,
    "email": obj.email,
    "phone": obj.phone,
    "address": obj.address,
    // "photo": obj.photo,
    // "document": obj.document,
    "level_applying_for": obj.levelApplyingFor,
    "qualification_applying_with": obj.qualificationApplyingWith,
    "programme_applying_for": obj.programmeApplyingFor,
    "highest_qualification_obtained": obj.highestQualificationObtained,
    "referral": obj.referral,
    "referral_details": obj.referralDetails,
    "gender": obj.gender,
    "religion": obj.religion,
    "language": obj.language,
    "marital_status": obj.maritalStatus,
    "occupation": obj.occupation,
    "identification_type": obj.identificationType,
    "identification_number": obj.identificationNumber,
    "sponsor_type": obj.sponsorType,
    "sponsor_name": obj.sponsorName,
    "sponsor_address": obj.sponsorAddress,
    "referee_name": obj.refereeName,
    "referee_phone": obj.refereePhone,
    "referee_email": obj.refereeEmail,
    "referee_address": obj.refereeAddress,
    "next_of_kin_name": obj.nokName,
    "next_of_kin_phone": obj.nokPhone,
    "next_of_kin_email": obj.nokEmail,
    "next_of_kin_address": obj.nokAddress,
    "spouse_name": obj.spouseName,
    "spouse_phone": obj.spousePhone,
    "spouse_email": obj.spouseEmail,
    "spouse_address": obj.spouseAddress,
    "residential_address": obj.residentialAddress,
    "permanent_address": obj.permanentAddress,
    "work_address": obj.workAddress,
    "referral_type": obj.referralType,
    "referral_description": obj.referralDescription,
    "nationality_id": obj.nationalityId,
    "state_id": obj.stateId,
    "lga_id": obj.lgaId,
    "local_government_area": obj.lga,
    "residence_country_id": obj.residenceCountryId,
    "residence_state_id": obj.residenceStateId,
    "ssce_1": obj.ssceOne,
    "candidate_exam_number_1": obj.candidateExamNumber,
    "exam_center_name_1": obj.examCenterName,
    "exam_center_number_1": obj.examCenterNumber,
    "exam_year_1": obj.examYear
  });
}
