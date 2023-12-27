import '../../model/model.dart';
import '../../packages/package.dart';

abstract class SemesterFormDataState extends Equatable {
  const SemesterFormDataState();

  @override
  List<Object> get props => [];
}

class InitialState extends SemesterFormDataState {
  @override
  List<Object> get props => [];
}

class SemesterFormDataLoading extends SemesterFormDataState {
  @override
  List<Object> get props => [];
}

class SemesterFormDataLoaded extends SemesterFormDataState {
  final Register registerStudent;
  const SemesterFormDataLoaded(this.registerStudent);

  @override
  List<Object> get props => [registerStudent];
}

class SemesterFormDataFailure extends SemesterFormDataState {
  final String message;
  const SemesterFormDataFailure({required this.message});
  @override
  List<Object> get props => [message];
}
