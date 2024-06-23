import '../../packages/package.dart';
import '../../utils/global_states.dart';
import 'payment_history_state.dart';

class PaymentHistoryCubit extends Cubit<PaymentHistoryState> {
  PaymentHistoryCubit() : super(InitialState());
  loadPaymentHistoryFromServer() async {
    try {
      emit(PaymentHistoryLoading());
      final response = await repository.getPaymentHistory();
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(PaymentHistoryLoaded(response.transactions!));
      } else {
        emit(PaymentHistoryFailure(message: response.message.toString()));
      }
    } catch (e) {
      debugPrint("problem sending request: ${e.toString()}");
    }
  }

  // void filterItems(String query) {
  //   final filteredItems = state.
  //       .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  //   emit(PaymentHistoryLoaded(allItems: state.allItems, displayedHistory: filteredItems));
  // }
}
