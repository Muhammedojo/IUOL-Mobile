import 'dart:developer';

import 'package:ioul/model/model.dart';
import 'package:ioul/provider/failure.dart';
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
      response.fold(
          (l) => emit(VerifyScratchPinFailure(message: l.failureMessage())),
          (r) => emit(VerifyScratchPinLoaded(r.data!)));
    } on Failure catch (e) {
      emit(VerifyScratchPinFailure(message: e.failureMessage()));
    } catch (e) {
      emit(VerifyScratchPinFailure(message: e.toString()));
    }
  }
}
