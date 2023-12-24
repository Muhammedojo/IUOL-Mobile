import '../../model/model.dart';
import '../../packages/package.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class InitialState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoaded extends RegisterState {
  const RegisterLoaded(this.register);

  final List<Register> register;

  @override
  List<Object> get props => [register];
}

class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure({required this.message});
  @override
  List<Object> get props => [message];
}
