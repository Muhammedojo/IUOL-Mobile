import '../../../../../core/core.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitialState extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationLoading extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationLoaded extends NotificationState {
  final List<Notificationss> notificationList;
  const NotificationLoaded(this.notificationList);

  @override
  List<Object> get props => [notificationList];
  @override
  String toString() =>
      'NotificationsLoaded { notifications: $notificationList }';
}

class NotificationFailure extends NotificationState {
  final String message;
  const NotificationFailure({required this.message});
  @override
  List<Object> get props => [message];
}
