import '../../packages/package.dart';
import '../../response/response.dart';

abstract class VerifyScratchPinState extends Equatable {
  const VerifyScratchPinState();

  @override
  List<Object> get props => [];
}

class VerifyScratchPinInitialState extends VerifyScratchPinState {
  @override
  List<Object> get props => [];
}

class VerifyScratchPinLoading extends VerifyScratchPinState {
  @override
  List<Object> get props => [];
}

class VerifyScratchPinLoaded extends VerifyScratchPinState {
  final GenericResponse verifyScratchPinResponse;
  const VerifyScratchPinLoaded(this.verifyScratchPinResponse);

  @override
  List<Object> get props => [verifyScratchPinResponse];
}

class VerifyScratchPinFailure extends VerifyScratchPinState {
  final String message;
  const VerifyScratchPinFailure({required this.message});
  @override
  List<Object> get props => [message];
}
