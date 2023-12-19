import 'package:ioul/model/model.dart';
import 'package:ioul/provider/api_provider.dart';
import 'package:ioul/response/response.dart';

class AppRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<GenericResponse> loadCountries() async =>
      _apiProvider.getCountryList();

  Future<GenericResponse> registerStudent(Register register) async =>
      _apiProvider.pushRegisterStudent(register);
}
