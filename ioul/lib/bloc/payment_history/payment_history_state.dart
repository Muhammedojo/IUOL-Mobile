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
  const PaymentHistoryLoaded();

  @override
  List<Object> get props => [];
}

class PaymentHistoryFailure extends PaymentHistoryState {
  final String message;
  const PaymentHistoryFailure({required this.message});
  @override
  List<Object> get props => [message];
}
