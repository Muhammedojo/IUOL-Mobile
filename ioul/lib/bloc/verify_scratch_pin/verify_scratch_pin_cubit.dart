import 'dart:developer';

import 'package:ioul/model/model.dart';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'verify_scratch_pin_state.dart';

class VerifyScratchPinCubit extends Cubit<VerifyScratchPinState> {
  VerifyScratchPinCubit() : super(VerifyScratchPinInitialState());

  pushPinToServer(VerifyScratchCardPin data) async {
    log("i'm pushing data to server");
    try {
      emit(VerifyScratchPinLoading());
      final response = await repository.verifyScratchCard(data.pin ?? "");
      if (response.isConnectionSuccessful()) {
        emit(VerifyScratchPinLoaded(response));
      } else {
        emit(VerifyScratchPinFailure(message: response.responseMessage));
      }
    } catch (e) {
      emit(VerifyScratchPinFailure(message: e.toString()));
    }
  }
}
