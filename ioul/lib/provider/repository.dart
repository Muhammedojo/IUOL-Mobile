import 'package:ioul/model/model.dart';
import 'package:ioul/provider/api_provider.dart';
import 'package:ioul/response/programme_response.dart';
import 'package:ioul/response/register_response.dart';
import 'package:ioul/response/response.dart';

import '../response/country_response.dart';
import '../response/programme_response.dart';

class AppRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Login> login(
          String username, String password, String deviceToken) async =>
      _apiProvider.login(username, password, deviceToken);

  Future<GenericResponse> forgotPassword(String email) async =>
      _apiProvider.forgotPassword(email);

  Future<GenericResponse> newPassword(String password, String confirmPassword,
          String email, String pin) async =>
      _apiProvider.newPassword(password, confirmPassword, pin, email);

  Future<GenericResponse> resetPassword(String pin, String email) async =>
      _apiProvider.resetPassword(pin, email);

  Future<CountryResponse> loadCountries() async =>
      _apiProvider.getCountryList();

  Future<GenericResponse> loadCourses() async => _apiProvider.getCoursesList();
  Future<GenericResponse> loadCourseDetails() async =>
      _apiProvider.getCourseDetails();

  Future<GenericResponse> loadCourseAudio() async =>
      _apiProvider.getCourseAudio();
  Future<GenericResponse> loadCourseVideo() async =>
      _apiProvider.getCourseVideo();
  Future<GenericResponse> loadCourseDocument() async =>
      _apiProvider.getCourseDocument();

  Future<GenericResponse> getPaymentType() async =>
      _apiProvider.getPaymentType();

  Future<GenericResponse> getPaymentHistory() async =>
      _apiProvider.getPaymentHistory();

  Future<RegisterResponse> registerStudent(Register register) async =>
      _apiProvider.pushRegisterStudent(register);

  Future<GenericResponse> submitApplication(
          SubmitApplication application) async =>
      _apiProvider.pushSubmitApplication(application);

  Future<ProgrammeResponse> submitProgram(ApplicationFormData formData) async =>
      _apiProvider.pushSubmitProgram(formData);

  //Future<GenericResponse> verifyEmail(String pin, String email) async =>
  Future<EmailVerification> verifyEmail(String pin, String email) async =>
      _apiProvider.verifyEmail(pin: pin, email: email);

  Future<GenericResponse> verifyScratchCard(String pin) async =>
      _apiProvider.verifyScratchCard(pin: pin);

  Future<GenericResponse> resendEmailVerification(String email) async =>
      _apiProvider.resendEmailVerification(email: email);
}
