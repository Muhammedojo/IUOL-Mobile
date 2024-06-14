import '../../../response/responses.dart';
import '../../core.dart';

abstract class PaymentTypeState extends Equatable {
  const PaymentTypeState();

  @override
  List<Object> get props => [];
}

class InitialPaymentTypeState extends PaymentTypeState {
  @override
  List<Object> get props => [];
}

class PaymentTypeLoading extends PaymentTypeState {
  @override
  List<Object> get props => [];
}

class PaymentTypeLoaded extends PaymentTypeState {
  final GenericResponse paymentType;
  const PaymentTypeLoaded(this.paymentType);

  @override
  List<Object> get props => [paymentType];
}

class PaymentTypeFailure extends PaymentTypeState {
  final String message;
  const PaymentTypeFailure({required this.message});
  @override
  List<Object> get props => [message];
}
