import '../../../../../core/core.dart';
import 'resend_email_verification_state.dart';

class ResendEmailVerificationCubit extends Cubit<ResendEmailVerificationState> {
  ResendEmailVerificationCubit() : super(ResendEmailVerificationInitialState());

  resendPin(ResendEmailVerification data) async {
    try {
      emit(ResendEmailVerificationLoading());
      final response =
          await repository.resendEmailVerification('${data.email}');
      //log("response body first: ${response.datas}");
      if (response.isConnectionSuccessful()) {
        emit(ResendEmailVerificationLoaded(response));
      } else {
        // log("response error body: ${response.responseMessage}");
        emit(ResendEmailVerificationFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(ResendEmailVerificationFailure(message: e.toString()));
    }
  }
}
