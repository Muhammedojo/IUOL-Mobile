import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../model/model.dart';
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

  String selectedValue = "";

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
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
  Widget build(BuildContext context) => ProgrammeView(this);

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
      application.programmeApplyingFor = programController.text.trim();

      GlobalVariables.applications.value = application;

      onNextPressed();
    } else {
      WidgetHelper.showToastError(context, "Fill required field.");
      return;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
