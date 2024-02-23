import '../../packages/package.dart';

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
  //final GenericResponse countryResponse;
  const CoursesLoaded(
      // this.countryResponse
      );

  @override
  List<Object> get props => [];
}

class CoursesFailure extends CoursesState {
  final String message;
  const CoursesFailure({required this.message});
  @override
  List<Object> get props => [message];
}
