import '../../packages/package.dart';

abstract class CourseDocumentResourcesState extends Equatable {
  const CourseDocumentResourcesState();

  @override
  List<Object> get props => [];
}

class CourseDocumentResourcesInitialState extends CourseDocumentResourcesState {
  @override
  List<Object> get props => [];
}

class CourseDocumentResourcesLoading extends CourseDocumentResourcesState {
  @override
  List<Object> get props => [];
}

class CourseDocumentResourcesLoaded extends CourseDocumentResourcesState {
  const CourseDocumentResourcesLoaded();

  @override
  List<Object> get props => [];
}

class CourseDocumentResourcesFailure extends CourseDocumentResourcesState {
  final String message;
  const CourseDocumentResourcesFailure({required this.message});
  @override
  List<Object> get props => [message];
}
