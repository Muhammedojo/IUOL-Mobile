import '../../packages/package.dart';

abstract class CourseAudioResourcesState extends Equatable {
  const CourseAudioResourcesState();

  @override
  List<Object> get props => [];
}

class InitialState extends CourseAudioResourcesState {
  @override
  List<Object> get props => [];
}

class CourseAudioResourcesLoading extends CourseAudioResourcesState {
  @override
  List<Object> get props => [];
}

class CourseAudioResourcesLoaded extends CourseAudioResourcesState {
  const CourseAudioResourcesLoaded();

  @override
  List<Object> get props => [];
}

class CourseAudioResourcesFailure extends CourseAudioResourcesState {
  final String message;
  const CourseAudioResourcesFailure({required this.message});
  @override
  List<Object> get props => [message];
}
