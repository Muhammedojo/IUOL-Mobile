import '../../../../../core/core.dart';
import '../bloc.dart';

class VerifyScratchPinCubit extends Cubit<VerifyScratchPinState> {
  VerifyScratchPinCubit() : super(VerifyScratchPinInitialState());

  pushPinToServer(VerifyScratchCardPin data) async {
    try {
      emit(VerifyScratchPinLoading());
      final response = await repository.verifyScratchCard(data.pin ?? "");
      if (response.isConnectionSuccessful()) {
        emit(VerifyScratchPinLoaded(response));
      } else {
        emit(VerifyScratchPinFailure(message: '${response.message}'));
      }
    } catch (e) {
      emit(VerifyScratchPinFailure(message: e.toString()));
    }
  }
}
