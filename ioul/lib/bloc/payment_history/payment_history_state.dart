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
  final Register registerStudent;
  const PaymentHistoryLoaded(this.registerStudent);

  @override
  List<Object> get props => [registerStudent];
}

class PaymentHistoryFailure extends PaymentHistoryState {
  final String message;
  const PaymentHistoryFailure({required this.message});
  @override
  List<Object> get props => [message];
}
