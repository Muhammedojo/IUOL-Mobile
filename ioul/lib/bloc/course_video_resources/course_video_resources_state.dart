import '../../packages/package.dart';

abstract class CourseVideoResourcesState extends Equatable {
  const CourseVideoResourcesState();

  @override
  List<Object> get props => [];
}

class InitialState extends CourseVideoResourcesState {
  @override
  List<Object> get props => [];
}

class CourseVideoResourcesLoading extends CourseVideoResourcesState {
  @override
  List<Object> get props => [];
}

class CourseVideoResourcesLoaded extends CourseVideoResourcesState {
  const CourseVideoResourcesLoaded();

  @override
  List<Object> get props => [];
}

class CourseVideoResourcesFailure extends CourseVideoResourcesState {
  final String message;
  const CourseVideoResourcesFailure({required this.message});
  @override
  List<Object> get props => [message];
}
