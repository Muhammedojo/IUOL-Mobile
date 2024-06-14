import '../../../response/course_reg_response.dart';
import '../../../response/response.dart';
import '../../core.dart';

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
  final CourseRegResponse courseRegData;
  const CourseRegLoaded(this.courseRegData);

  @override
  List<Object> get props => [courseRegData];
}

class CourseRegPushLoaded extends CourseRegState {
  final GenericResponse courseRegData;
  const CourseRegPushLoaded(this.courseRegData);

  @override
  List<Object> get props => [courseRegData];
}

class CourseRegFailure extends CourseRegState {
  final String message;
  const CourseRegFailure({required this.message});
  @override
  List<Object> get props => [message];
}
