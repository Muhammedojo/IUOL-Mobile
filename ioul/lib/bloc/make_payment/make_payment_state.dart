part of 'make_payment_cubit.dart';

sealed class MakePaymentState extends Equatable {
  const MakePaymentState();

  @override
  List<Object> get props => [];
}

final class MakePaymentInitial extends MakePaymentState {}

final class MakePaymentLoading extends MakePaymentState {}

final class MakePaymentSuccess extends MakePaymentState {
  final String data;
  const MakePaymentSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

final class MakePaymentError extends MakePaymentState {
  final String error;
  const MakePaymentError({required this.error});

  @override
  List<Object> get props => [error];
}
