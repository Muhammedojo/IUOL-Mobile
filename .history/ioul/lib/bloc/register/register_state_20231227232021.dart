import 'package:ioul/response/response.dart';

import '../../model/model.dart';
import '../../packages/package.dart';

abstract class RegisterState extends Equatable {
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
  final GenericResponse registerStudent;
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
