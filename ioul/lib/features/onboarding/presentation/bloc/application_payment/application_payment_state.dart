import '../../data/response/responses.dart';
import '../../core.dart';

abstract class ApplicationPaymentState extends Equatable {
  const ApplicationPaymentState();

  @override
  List<Object> get props => [];
}

class ApplicationPaymentInitialState extends ApplicationPaymentState {
  @override
  List<Object> get props => [];
}

class ApplicationPaymentLoading extends ApplicationPaymentState {
  @override
  List<Object> get props => [];
}

class ApplicationPaymentLoaded extends ApplicationPaymentState {
  final GenericResponse paymentLink;
  const ApplicationPaymentLoaded(this.paymentLink);

  @override
  List<Object> get props => [paymentLink];
}

class ApplicationPaymentFailure extends ApplicationPaymentState {
  final String message;
  const ApplicationPaymentFailure({required this.message});
  @override
  List<Object> get props => [message];
}
