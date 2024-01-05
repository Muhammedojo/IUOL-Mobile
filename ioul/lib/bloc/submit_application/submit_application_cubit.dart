import 'dart:developer';
import 'package:ioul/utils/global_states.dart';
import '../../model/model.dart';
import '../../packages/package.dart';
import 'submit_application_state.dart';

class SubmitApplicationCubit extends Cubit<SubmitApplicationState> {
  SubmitApplicationCubit() : super(SubmitApplicationInitialState());

  pushApplicationToServer(SubmitApplication submitApplication) async {}
}
