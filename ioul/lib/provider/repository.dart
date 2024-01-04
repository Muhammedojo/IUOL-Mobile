import 'package:ioul/model/model.dart';
import 'package:ioul/provider/api_provider.dart';
import 'package:ioul/response/register_response.dart';
import 'package:ioul/response/response.dart';

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

  Future<GenericResponse> loadCountries() async =>
      _apiProvider.getCountryList();

  Future<GenericResponse> getPaymentType() async =>
      _apiProvider.getPaymentType();

  Future<GenericResponse> getPaymentHistory() async =>
      _apiProvider.getPaymentHistory();

  Future<RegisterResponse> registerStudent(Register register) async =>
      _apiProvider.pushRegisterStudent(register);

  Future<GenericResponse> verifyEmail(String pin, String email) async =>
      _apiProvider.verifyEmail(pin: pin, email: email);

  Future<GenericResponse> verifyScratchCard(String pin) async =>
      _apiProvider.verifyScratchCard(pin: pin);

  Future<GenericResponse> resendEmailVerification(String email) async =>
      _apiProvider.resendEmailVerification(email: email);
}
