import '../../core.dart';
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
        emit(PaymentHistoryFailure(message: '${response.message}'));
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
