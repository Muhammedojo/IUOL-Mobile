import 'package:bloc/bloc.dart';
import 'package:ioul/response/response.dart';
import 'package:meta/meta.dart';

import '../../packages/package.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailInitial());
}
