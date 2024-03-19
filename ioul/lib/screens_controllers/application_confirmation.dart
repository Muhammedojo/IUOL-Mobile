import 'package:ioul/model/model.dart';
import 'package:ioul/packages/package.dart';

import '../bloc/application_form_data/application_form_data_cubit.dart';
import '../helpers/helper.dart';
import '../router/router.dart';
import '../screen_views/application_confirmation.dart';

class ApplicationConfirmation extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ApplicationConfirmation({Key? key}) : super(key: key);

  @override
  ApplicationConfirmationController createState() =>
      ApplicationConfirmationController();
}

class ApplicationConfirmationController extends State<ApplicationConfirmation> {
  //... //Initialization code, state vars etc, all go here

  String selectedValue = "";

  final TextEditingController dropdownController = TextEditingController();

  setSelectedValue(String? value) {
    setState(() {
      selectedValue = value!;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ApplicationConfirmationView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  void getFormDataForSelectedProgram() async {
    context.pushNamed(RouteConstants.applicationForm);
    var program = ApplicationFormData();

    program.programme = 'degree';
    //selectedValue;

    context.read<ApplicationFormDataCubit>().pushProgramToServer(program);
  }
}
