import '../../model/model.dart';
import '../../packages/package.dart';

abstract class UpcomingTaskState extends Equatable {
  const UpcomingTaskState();

  @override
  List<Object> get props => [];
}

class UpcomingTaskInitialState extends UpcomingTaskState {
  @override
  List<Object> get props => [];
}

class UpcomingTaskLoading extends UpcomingTaskState {
  @override
  List<Object> get props => [];
}

class UpcomingTaskLoaded extends UpcomingTaskState {
  final List<UpcomingTask> upcomingTaskList;
  const UpcomingTaskLoaded(this.upcomingTaskList);

  @override
  List<Object> get props => [upcomingTaskList];
  @override
  String toString() =>
      'UpcomingTaskLoaded { upcoming_assignments: $upcomingTaskList }';
}

class UpcomingTaskFailure extends UpcomingTaskState {
  final String message;
  const UpcomingTaskFailure({required this.message});
  @override
  List<Object> get props => [message];
}
