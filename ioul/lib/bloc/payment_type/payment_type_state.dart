import 'package:ioul/response/response.dart';

import '../../model/model.dart';
import '../../packages/package.dart';

abstract class PaymentTypeState extends Equatable {
  const PaymentTypeState();

  @override
  List<Object> get props => [];
}

class InitialState extends PaymentTypeState {
  @override
  List<Object> get props => [];
}

class PaymentTypeLoading extends PaymentTypeState {
  @override
  List<Object> get props => [];
}

class PaymentTypeLoaded extends PaymentTypeState {
  final GenericResponse registerStudent;
  const PaymentTypeLoaded(this.registerStudent);

  @override
  List<Object> get props => [registerStudent];
}

class PaymentTypeFailure extends PaymentTypeState {
  final String message;
  const PaymentTypeFailure({required this.message});
  @override
  List<Object> get props => [message];
}
