import 'package:ioul/screens/screens.dart';

import '../../model/model.dart';
import '../../packages/package.dart';

abstract class PaymentHistoryState extends Equatable {
  const PaymentHistoryState();

  @override
  List<Object> get props => [];
}

class InitialState extends PaymentHistoryState {
  @override
  List<Object> get props => [];
}

class PaymentHistoryLoading extends PaymentHistoryState {
  @override
  List<Object> get props => [];
}

class PaymentHistoryLoaded extends PaymentHistoryState {
  final List<PaymentsHistory> paymentHistoryList;
  const PaymentHistoryLoaded(this.paymentHistoryList);

  @override
  List<Object> get props => [paymentHistoryList];
}

class PaymentHistoryFailure extends PaymentHistoryState {
  final String message;
  const PaymentHistoryFailure({required this.message});
  @override
  List<Object> get props => [message];
}
