import 'package:ioul/model/user.dart';

class ProgrammeResponse {
  UserData? user;
  List<String>? genders;
  List<String>? maritalStatuses;
  List<String>? religions;
  List<String>? languages;
  List<String>? identificationTypes;
  List<String>? sponsors;
  List<String>? underGraduateQualifications;
  List<String>? postGraduateQualifications;
  List<String>? certificates;
  List<String>? examinations;
  List<String>? referralTypes;
  List<String>? programmes;
  int? statusCode;
  String? message;

  ProgrammeResponse({
    this.user,
    this.certificates,
    this.examinations,
    this.genders,
    this.identificationTypes,
    this.languages,
    this.maritalStatuses,
    this.postGraduateQualifications,
    this.referralTypes,
    this.religions,
    this.sponsors,
    this.underGraduateQualifications,
    this.programmes,
    this.statusCode,
    this.message,
  });

  factory ProgrammeResponse.fromJson(Map<String, dynamic> json) {
    List<String> newGender = [];
    for (var item in json['data']['formOptions']['genders'].values) {
      newGender.add(item);
    }
    List<String> maritalStatusData = [];
    for (var item in json['data']['formOptions']['maritalStatuses'].values) {
      maritalStatusData.add(item);
    }
    List<String> religionsData = [];
    for (var item in json['data']['formOptions']['religions'].values) {
      religionsData.add(item);
    }
    List<String> languagesData = [];
    for (var item in json['data']['formOptions']['languages'].values) {
      languagesData.add(item);
    }
    List<String> identificationTypesData = [];
    for (var item
        in json['data']['formOptions']['identificationTypes'].values) {
      identificationTypesData.add(item);
    }
    List<String> sponsorsData = [];
    for (var item in json['data']['formOptions']['sponsors'].values) {
      sponsorsData.add(item);
    }
    List<String> underGraduateQualificationsData = [];
    for (var item
        in json['data']['formOptions']['underGraduateQualifications'].values) {
      underGraduateQualificationsData.add(item);
    }
    List<String> postGraduateQualificationsData = [];
    for (var item
        in json['data']['formOptions']['postGraduateQualifications'].values) {
      postGraduateQualificationsData.add(item);
    }
    List<String> certificatesData = [];
    for (var item in json['data']['formOptions']['certificates'].values) {
      certificatesData.add(item);
    }
    List<String> examinationsData = [];
    for (var item in json['data']['formOptions']['examinations'].values) {
      examinationsData.add(item);
    }
    List<String> referralTypesData = [];
    for (var item in json['data']['formOptions']['referralTypes'].values) {
      referralTypesData.add(item);
    }
    List<String> programmesData = [];
    if (json['data']['formOptions']['programmes'].values != '') {
      for (var item in json['data']['formOptions']['programmes'].values) {
        programmesData.add(item);
      }
    }
    return ProgrammeResponse(
      user: json['user'],
      genders: newGender,
      maritalStatuses: maritalStatusData,
      religions: religionsData,
      languages: languagesData,
      identificationTypes: identificationTypesData,
      sponsors: sponsorsData,
      underGraduateQualifications: underGraduateQualificationsData,
      postGraduateQualifications: postGraduateQualificationsData,
      certificates: certificatesData,
      examinations: examinationsData,
      referralTypes: referralTypesData,
      programmes: programmesData,
    );
  }
}
