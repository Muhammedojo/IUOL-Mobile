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
  final Register registerStudent;
  const RegisterLoaded(this.registerStudent);

  @override
  List<Object> get props => [registerStudent];
}

class RegisterFailure extends RegisterState {
  final String message;
  const RegisterFailure({required this.message});
  @override
  List<Object> get props => [message];
}
