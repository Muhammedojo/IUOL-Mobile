import 'dart:developer';
import 'package:ioul/model/model.dart';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'verify_scratch_pin_state.dart';

class VerifyEmailCubit extends Cubit<VerifyScratchPinState> {
  VerifyEmailCubit() : super(VerifyScratchPinInitialState());

  pushPinToServer(EmailVerification data) async {
    try {
      emit(VerifyScratchPinLoading());
      final response = await repository.verifyScratchCard(data.pin ?? "");
      log("response body first: ${response.data}");
      if (response.isConnectionSuccessful()) {
        emit(VerifyScratchPinLoaded(response));
      } else {
        log("response error body: ${response.responseMessage}");
        emit(VerifyScratchPinFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
      emit(VerifyScratchPinFailure(message: e.toString()));
    }
  }
}
