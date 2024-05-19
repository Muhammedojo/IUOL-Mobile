import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'cubit.dart';

class PaymentHistoryCubit extends Cubit<PaymentHistoryState> {
  PaymentHistoryCubit() : super(PaymentHistoryLoading());
  loadPaymentHistoryFromServer() async {
    try {
      emit(PaymentHistoryLoading());
      final response = await repository.getPaymentHistory();
      if ((response.statusCode == 200 || response.statusCode == 201)) {
        emit(PaymentHistoryLoaded(response.transactions!));
      } else {
        // log("response error body: ${response.message}");
        emit(PaymentHistoryFailure(message: '${response.message}'));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }
}
