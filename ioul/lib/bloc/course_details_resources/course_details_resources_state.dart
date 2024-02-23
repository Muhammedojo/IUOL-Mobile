import '../../packages/package.dart';

abstract class CourseDetailsResourcesState extends Equatable {
  const CourseDetailsResourcesState();

  @override
  List<Object> get props => [];
}

class CourseDetailsResourcesInitialState extends CourseDetailsResourcesState {
  @override
  List<Object> get props => [];
}

class CourseDetailsResourcesLoading extends CourseDetailsResourcesState {
  @override
  List<Object> get props => [];
}

class CourseDetailsResourcesLoaded extends CourseDetailsResourcesState {
  const CourseDetailsResourcesLoaded();

  @override
  List<Object> get props => [];
}

class CourseDetailsResourcesFailure extends CourseDetailsResourcesState {
  final String message;
  const CourseDetailsResourcesFailure({required this.message});
  @override
  List<Object> get props => [message];
}
