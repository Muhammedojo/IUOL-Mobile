// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

part of 'verify_email_cubit.dart';

abstract class VerifyEmailState extends Equatable {
  const VerifyEmailState();

  @override
  List<Object> get props => [];
}

class VerifyEmailInitialState extends VerifyEmailState {
  @override
  List<Object> get props => [];
}

class VerifyEmailLoading extends VerifyEmailState {
  @override
  List<Object> get props => [];
}

class VerifyEmailLoaded extends VerifyEmailState {
  final VerifyEmailResponse VerifyEmailStudent;
  const VerifyEmailLoaded(
    this.VerifyEmailStudent,
  );

  @override
  List<Object> get props => [VerifyEmailStudent];

  VerifyEmailLoaded copyWith({
    VerifyEmailResponse? VerifyEmailStudent,
  }) {
    return VerifyEmailLoaded(
      VerifyEmailStudent ?? this.VerifyEmailStudent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'VerifyEmailStudent': VerifyEmailStudent.toMap(),
    };
  }

  factory VerifyEmailLoaded.fromMap(Map<String, dynamic> map) {
    return VerifyEmailLoaded(
      VerifyEmailResponse.fromMap(map['VerifyEmailStudent'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyEmailLoaded.fromJson(String source) => VerifyEmailLoaded.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VerifyEmailLoaded(VerifyEmailStudent: $VerifyEmailStudent)';

  @override
  bool operator ==(covariant VerifyEmailLoaded other) {
    if (identical(this, other)) return true;
  
    return 
      other.VerifyEmailStudent == VerifyEmailStudent;
  }

  @override
  int get hashCode => VerifyEmailStudent.hashCode;
}

class VerifyEmailFailure extends VerifyEmailState {
  final String message;
  const VerifyEmailFailure({required this.message});
  @override
  List<Object> get props => [message];
}
