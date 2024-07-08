import 'package:ioul/core/data/model/model.dart';
import 'package:ioul/core/api/provider/api_provider.dart';
import '../../data/response/responses.dart';
import 'shared_prefrence.dart';

class AppRepository {
  final ApiProvider _apiProvider = ApiProvider();
  final AppPrefs _sessionManager = AppPrefs();

  Future<Login> login(
          String username, String password, String deviceToken) async =>
      _apiProvider.login(username, password, deviceToken);

  Future<GenericResponse> logout() async => _apiProvider.logout();

  Future<GenericResponse> forgotPassword(String email) async =>
      _apiProvider.forgotPassword(email);

  Future<GenericResponse> newPassword(String password, String confirmPassword,
          String email, String pin) async =>
      _apiProvider.newPassword(password, confirmPassword, pin, email);

  Future<GenericResponse> resetPassword(String pin, String email) async =>
      _apiProvider.resetPassword(pin, email);

  Future<CountryResponse> loadCountries() async =>
      _apiProvider.getCountryList();

  Future<GenericResponse> loadPaymentType() async =>
      _apiProvider.getPaymentTypeList();

  Future<GenericResponse> loadSemesterFormData() async =>
      _apiProvider.getSemesterFormData();

  Future<EnrolledCourseResponse> loadCourses() async =>
      _apiProvider.getCoursesList();

  Future<NotificationResponse> loadNotifications() async =>
      _apiProvider.getNotificationsList();

  Future<GenericResponse> loadJournal() async => _apiProvider.getJournal();

  Future<GenericResponse> loadCollection() async =>
      _apiProvider.getCollection();

  Future<GenericResponse> loadCoursesWithReport() async =>
      _apiProvider.getCoursesWithReportList();

  Future<UpcomingAssignmentResponse> loadUpcomingTasks() async =>
      _apiProvider.getUpcomingTaskList();

  Future<GenericResponse> loadCoursesAssignment() async =>
      _apiProvider.getCoursesAssignment();

  Future<CourseRegResponse> initializeCourseReg() async =>
      _apiProvider.initializeCourseReg();

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

  Future<PaymentHistoryResponse> getPaymentHistory() async =>
      _apiProvider.getPaymentHistory();

  Future<RegisterResponse> registerStudent(Register register) async =>
      _apiProvider.pushRegisterStudent(register);

  Future<GenericResponse> submitApplication(
          SubmitApplication application) async =>
      _apiProvider.pushSubmitApplication(application);

  Future<GenericResponse> submitCourseRegistration(SubmitCourseReg reg) async =>
      _apiProvider.submitCourseRegistration(reg);

  Future<ProgrammeResponse> submitProgram(ApplicationFormData formData) async =>
      _apiProvider.pushSubmitProgram(formData);

  //Future<GenericResponse> verifyEmail(String pin, String email) async =>
  Future<EmailVerification> verifyEmail(String pin, String email) async =>
      _apiProvider.verifyEmail(pin: pin, email: email);

  Future<Login> getUser() async => _sessionManager.getUser();

  Future<GenericResponse> verifyScratchCard(String pin) async =>
      _apiProvider.verifyScratchCard(pin: pin);

  Future<GenericResponse> resendEmailVerification(String email) async =>
      _apiProvider.resendEmailVerification(email: email);
}
