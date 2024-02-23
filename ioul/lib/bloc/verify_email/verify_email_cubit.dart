import 'dart:developer';
import 'package:ioul/model/model.dart';
import 'package:ioul/provider/shared_prefrence.dart';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'verify_email_state.dart';

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
