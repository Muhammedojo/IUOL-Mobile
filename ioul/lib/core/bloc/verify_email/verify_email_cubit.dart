import 'dart:developer';
import 'package:ioul/core/api/provider/shared_prefrence.dart';
import '../../core.dart';
import '../../utils/global_states.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailInitialState());

  pushPinToServer(EmailVerification data) async {
    try {
      emit(VerifyEmailLoading());
      final response =
          await repository.verifyEmail(data.pin ?? "", data.email ?? "");
      log("response body first: ${response.user}");
      if (response.statusCode == 201 || response.statusCode == 200) {
        Login loginData = Login()..token = response.token;

        AppPrefs().saveTokenToPrefs(loginData);
        emit(VerifyEmailLoaded(response));
      } else {
        log("response error body: ${response.message}");
        emit(VerifyEmailFailure(message: response.message ?? ""));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(VerifyEmailFailure(message: e.toString()));
    }
  }
}
