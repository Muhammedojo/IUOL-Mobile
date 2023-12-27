import '../../model/model.dart';
import '../../packages/package.dart';
import 'cubit.dart';

class PaymentTypeCubit extends Cubit<PaymentTypeState> {
  PaymentTypeCubit() : super(PaymentTypeLoading());
  var register = Register();
}
