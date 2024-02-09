import 'package:ioul/response/response.dart';
import '../../packages/package.dart';

abstract class SubmitApplicationState extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmitApplicationInitialState extends SubmitApplicationState {
  @override
  List<Object> get props => [];
}

class SubmitApplicationLoading extends SubmitApplicationState {
  @override
  List<Object> get props => [];
}

class SubmitApplicationLoaded extends SubmitApplicationState {
  final GenericResponse submitApplication;
  SubmitApplicationLoaded(this.submitApplication);

  @override
  List<Object> get props => [submitApplication];
}

class SubmitApplicationFailure extends SubmitApplicationState {
  final String message;
  SubmitApplicationFailure({required this.message});

  @override
  List<Object> get props => [message];
}
