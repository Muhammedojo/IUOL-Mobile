import 'package:equatable/equatable.dart';

import '../../model/model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final Login login;

  const UserLoaded(this.login);

  @override
  List<Object> get props => [login];

  @override
  String toString() => 'UserLoaded { Login: $login }';
}

class UserNotLoaded extends UserState {}

class UserFailure extends UserState {
  final String error;

  const UserFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'UserFailure { error: $error }';
}
