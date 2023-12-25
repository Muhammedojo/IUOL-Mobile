import '../../model/model.dart';
import '../../packages/package.dart';
import 'cubit.dart';

class PaymentHistoryCubit extends Cubit<PaymentHistoryState> {
  PaymentHistoryCubit() : super(PaymentHistoryLoading());
  var register = Register();
}
