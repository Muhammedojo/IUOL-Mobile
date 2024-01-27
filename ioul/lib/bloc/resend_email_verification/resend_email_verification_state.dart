import '../../packages/package.dart';
import '../../response/response.dart';

abstract class ResendEmailVerificationState extends Equatable {
  const ResendEmailVerificationState();

  @override
  List<Object> get props => [];
}

class ResendEmailVerificationInitialState extends ResendEmailVerificationState {
  @override
  List<Object> get props => [];
}

class ResendEmailVerificationLoading extends ResendEmailVerificationState {
  @override
  List<Object> get props => [];
}

class ResendEmailVerificationLoaded extends ResendEmailVerificationState {
  final GenericResponse resendEmailVerificationResponse;
  const ResendEmailVerificationLoaded(this.resendEmailVerificationResponse);

  @override
  List<Object> get props => [resendEmailVerificationResponse];
}

class ResendEmailVerificationFailure extends ResendEmailVerificationState {
  final String message;
  const ResendEmailVerificationFailure({required this.message});
  @override
  List<Object> get props => [message];
}
