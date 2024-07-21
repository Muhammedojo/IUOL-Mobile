import '../../../../../core/core.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

class CoursesInitialState extends CoursesState {
  @override
  List<Object> get props => [];
}

class CoursesLoading extends CoursesState {
  @override
  List<Object> get props => [];
}

class CoursesLoaded extends CoursesState {
  final List<Course> courseList;
  const CoursesLoaded(this.courseList);

  @override
  List<Object> get props => [courseList];
  @override
  String toString() => 'CoursesLoaded { courses: $courseList }';
}

class CoursesFailure extends CoursesState {
  final String message;
  const CoursesFailure({required this.message});
  @override
  List<Object> get props => [message];
}
