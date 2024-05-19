import 'package:ioul/packages/package.dart';

import '../bloc/bloc.dart';
import '../helpers/helper.dart';
import '../response/responses.dart';
import '../screen_views/programme_view.dart';
import '../utils/utils.dart';

class Programme extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Programme({
    Key? key,
    this.controller,
    this.initialProgress,
    this.selectedIndex,
    this.decreaseProgress,
  }) : super(key: key);

  final int? selectedIndex;
  final TabController? controller;
  final Function? initialProgress;
  final Function? decreaseProgress;

  @override
  ProgrammeController createState() => ProgrammeController();
}

class ProgrammeController extends State<Programme>
    with AutomaticKeepAliveClientMixin {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController programController = TextEditingController();
  final TextEditingController highestQualificationController =
      TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  String selectedProgramme = "";
  String selectedValue = "";

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  // ProgrammeResponse selectedProgramme = ProgrammeResponse();

  // onSelectProgramme(int value) {
  //   ApplicationFormDataState states =
  //       context.read<ApplicationFormDataCubit>().state;
  //   if (states is ApplicationFormDataLoaded) {
  //     selectedProgramme = states.formData.programmes.;
  //   }
  // }
  void onSelectProgramme(String selectedValue) {
    ApplicationFormDataState states =
        context.read<ApplicationFormDataCubit>().state;
    if (states is ApplicationFormDataLoaded) {
      Map<String, String> programmesMap = states.formData.programmesMap!;
      print('Selected ');
      // Find the key for the selected value
      String? selectedKey;
      programmesMap.forEach((key, value) {
        if (value == selectedValue) {
          selectedKey = key;
        }
      });
      print('Selected2');
      // Now you have the selectedKey which corresponds to the selectedValue
      if (selectedKey != null) {
        print('Selected key: $selectedKey');
        // Do something with the selectedKey
      } else {
        print('Selected value not found');
      }
    }
  }

  onNextPressed() {
    setState(() {
      widget.controller!.animateTo(5);
      widget.initialProgress!();
    });
  }

  onReversePressed() {
    setState(() {
      widget.controller!.animateTo(3);
      widget.decreaseProgress!();
    });
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProgrammeView(this);
  }

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  validateProgramInfo() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final application = GlobalVariables.applications.value;

      application.highestQualificationObtained =
          highestQualificationController.text.trim();
      application.qualificationApplyingWith =
          qualificationController.text.trim();
      application.levelApplyingFor = levelController.text.trim();
      application.programmeApplyingFor = '15';
      //programController.text.trim();

      GlobalVariables.applications.value = application;

      onNextPressed();
    } else {
      WidgetHelper.showToastError(context, "fill_required_fields");
      return;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
