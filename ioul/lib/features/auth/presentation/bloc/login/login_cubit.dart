import '../../../../../core/api/provider/shared_prefrence.dart';
import '../../../../../core/core.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  loginUser(Login data) async {
    try {
      emit(LoginLoading());
      final response = await repository.login(
          data.username ?? "", data.password ?? "", data.deviceToken ?? "");

      //log("response body first: ${response.datas}");
      if (response.isConnectionSuccessful()) {
        AppPrefs().saveTokenToPrefs(response);
        emit(LoginLoaded(response));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(LoginFailure(message: '${response.message}'));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(LoginFailure(message: e.toString()));
    }
  }
}
