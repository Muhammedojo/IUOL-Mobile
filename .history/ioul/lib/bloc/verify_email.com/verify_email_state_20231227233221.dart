part of 'verify_email_cubit.dart';

abstract class VerifyEmailState extends Equatable {
  const VerifyEmailState();

  @override
  List<Object> get props => [];
}

class VerifyEmailInitialState extends VerifyEmailState {
  @override
  List<Object> get props => [];
}

class VerifyEmailLoading extends VerifyEmailState {
  @override
  List<Object> get props => [];
}

class VerifyEmailLoaded extends VerifyEmailState {
  final VerifyEmailResponse verifyEmailResponse;
  const VerifyEmailLoaded(this.verifyEmailResponse);

  @override
  List<Object> get props => [verifyEmailResponse];
}

class VerifyEmailFailure extends VerifyEmailState {
  final String message;
  const VerifyEmailFailure({required this.message});
  @override
  List<Object> get props => [message];
}
