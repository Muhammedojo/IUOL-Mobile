import '../../../../../core/core.dart';

abstract class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

class ReportInitialState extends ReportState {
  @override
  List<Object> get props => [];
}

class ReportLoading extends ReportState {
  @override
  List<Object> get props => [];
}

class ReportLoaded extends ReportState {
  final List<Report> reportList;
  const ReportLoaded(this.reportList);

  @override
  List<Object> get props => [reportList];
}

class ReportFailure extends ReportState {
  final String message;
  const ReportFailure({required this.message});
  @override
  List<Object> get props => [message];
}
