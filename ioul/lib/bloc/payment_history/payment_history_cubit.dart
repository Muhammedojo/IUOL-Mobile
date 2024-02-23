import 'dart:developer';
import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'cubit.dart';

class PaymentHistoryCubit extends Cubit<PaymentHistoryState> {
  PaymentHistoryCubit() : super(PaymentHistoryLoading());
  loadPaymentHistoryFromServer() async {
    try {
      emit(PaymentHistoryLoading());
      final response = await repository.loadCourses();
      if (response.isConnectionSuccessful()) {
        emit(const PaymentHistoryLoaded());
      } else {
        log("response error body: ${response.responseMessage}");
        emit(PaymentHistoryFailure(message: response.responseMessage));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}
