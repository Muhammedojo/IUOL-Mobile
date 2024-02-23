import '../../packages/package.dart';

abstract class CourseDetailsState extends Equatable {
  const CourseDetailsState();

  @override
  List<Object> get props => [];
}

class CourseDetailsInitialState extends CourseDetailsState {
  @override
  List<Object> get props => [];
}

class CourseDetailsLoading extends CourseDetailsState {
  @override
  List<Object> get props => [];
}

class CourseDetailsLoaded extends CourseDetailsState {
  //final GenericResponse countryResponse;
  const CourseDetailsLoaded(
      // this.countryResponse
      );

  @override
  List<Object> get props => [];
}

class CourseDetailsFailure extends CourseDetailsState {
  final String message;
  const CourseDetailsFailure({required this.message});
  @override
  List<Object> get props => [message];
}
