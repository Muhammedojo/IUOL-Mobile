import '../../packages/package.dart';

abstract class CourseRegState extends Equatable {
  const CourseRegState();

  @override
  List<Object> get props => [];
}

class CourseRegInitialState extends CourseRegState {
  @override
  List<Object> get props => [];
}

class CourseRegLoading extends CourseRegState {
  @override
  List<Object> get props => [];
}

class CourseRegLoaded extends CourseRegState {
  // final GenericResponse courseList;
  const CourseRegLoaded(
      //this.courseList
      );

  @override
  List<Object> get props => [];
  // courseList];
}

class CourseRegFailure extends CourseRegState {
  final String message;
  const CourseRegFailure({required this.message});
  @override
  List<Object> get props => [message];
}
