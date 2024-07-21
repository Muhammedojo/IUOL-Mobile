import '../../../../../core/core.dart';

abstract class AssignmentState extends Equatable {
  const AssignmentState();

  @override
  List<Object> get props => [];
}

class AssignmentInitialState extends AssignmentState {
  @override
  List<Object> get props => [];
}

class AssignmentLoading extends AssignmentState {
  @override
  List<Object> get props => [];
}

class AssignmentLoaded extends AssignmentState {
  final List<AssignmentSummary> assignmentList;
  const AssignmentLoaded(this.assignmentList);

  @override
  List<Object> get props => [assignmentList];
}

class AssignmentFailure extends AssignmentState {
  final String message;
  const AssignmentFailure({required this.message});
  @override
  List<Object> get props => [message];
}
