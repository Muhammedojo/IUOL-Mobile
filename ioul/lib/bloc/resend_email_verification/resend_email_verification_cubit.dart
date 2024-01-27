import 'dart:developer';
import 'package:ioul/model/model.dart';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'resend_email_verification_state.dart';

class ResendEmailVerificationCubit extends Cubit<ResendEmailVerificationState> {
  ResendEmailVerificationCubit() : super(ResendEmailVerificationInitialState());

  resendPin(ResendEmailVerification data) async {
    try {
      emit(ResendEmailVerificationLoading());
      final response =
          await repository.resendEmailVerification(data.email ?? "");
      log("response body first: ${response.data}");
      if (response.isConnectionSuccessful()) {
        emit(ResendEmailVerificationLoaded(response));
      } else {
        log("response error body: ${response.responseMessage}");
        emit(ResendEmailVerificationFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(ResendEmailVerificationFailure(message: e.toString()));
    }
  }
}
