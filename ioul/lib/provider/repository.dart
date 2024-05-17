import 'package:dartz/dartz.dart';
import 'package:ioul/model/make_payment.dart';
import 'package:ioul/model/model.dart';
import 'package:ioul/provider/api_provider.dart';
import 'package:ioul/provider/api_response.dart';
import 'package:ioul/provider/failure.dart';

class AppRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<Either<Failure, ApiResponseImpl<LoginData>>> login(
          LoginData data) async =>
      _apiProvider.login(data: data);

  // Future<GenericResponse> forgotPassword(String email) async =>
  //     _apiProvider.forgotPassword(email);

  // Future<GenericResponse> newPassword(String password, String confirmPassword,
  //         String email, String pin) async =>
  //     _apiProvider.newPassword(password, confirmPassword, pin, email);

  // Future<GenericResponse> resetPassword(String pin, String email) async =>
  //     _apiProvider.resetPassword(pin, email);

  // Future<CountryResponse> loadCountries() async =>
  //     _apiProvider.getCountryList();

  // Future<GenericResponse> loadCourses() async => _apiProvider.getCoursesList();
  // Future<GenericResponse> loadCourseDetails() async =>
  //     _apiProvider.getCourseDetails();

  // Future<GenericResponse> loadCourseAudio() async =>
  //     _apiProvider.getCourseAudio();
  // Future<GenericResponse> loadCourseVideo() async =>
  //     _apiProvider.getCourseVideo();
  // Future<GenericResponse> loadCourseDocument() async =>
  //     _apiProvider.getCourseDocument();

  // Future<GenericResponse> getPaymentType() async =>
  //     _apiProvider.getPaymentType();

  // Future<GenericResponse> getPaymentHistory() async =>
  //     _apiProvider.getPaymentHistory();

  // Future<RegisterResponse> registerStudent(Register register) async =>
  //     _apiProvider.pushRegisterStudent(register);

  // Future<GenericResponse> submitApplication(
  //         SubmitApplication application) async =>
  //     _apiProvider.pushSubmitApplication(application);

  // Future<ProgrammeResponse> submitProgram(ApplicationFormData formData) async =>
  //     _apiProvider.pushSubmitProgram(formData);

  // //Future<GenericResponse> verifyEmail(String pin, String email) async =>
  // Future<EmailVerification> verifyEmail(String pin, String email) async =>
  //     _apiProvider.verifyEmail(pin: pin, email: email);

  Future<Either<Failure, ApiResponseImpl<String>>> verifyScratchCard(
          String pin) async =>
      _apiProvider.verifyScratchCardPin(pin: pin);
  Future<Either<Failure, ApiResponseImpl<ApplicationFormData>>>
      getApplicationFormData() async => _apiProvider.getApplicationForm();
  Future<Either<Failure, ApiResponseImpl<String>>> makePayment(
          MakePaymentData data) async =>
      _apiProvider.makePayment(data: data);
  // Future<GenericResponse> resendEmailVerification(String email) async =>
  //     _apiProvider.resendEmailVerification(email: email);
}
