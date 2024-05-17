import 'package:ioul/response/register_response.dart';
import '../../model/model.dart';
import '../../packages/package.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoaded extends RegisterState {
  final RegisterResponse registerStudent;
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

class LoginLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class LoginLoaded extends RegisterState {
  final LoginData registerStudent;
  const LoginLoaded({required this.registerStudent});

  @override
  List<Object> get props => [registerStudent];
}

class LoginFailure extends RegisterState {
  final String message;
  const LoginFailure({required this.message});
  @override
  List<Object> get props => [message];
}
