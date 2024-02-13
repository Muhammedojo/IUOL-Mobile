import 'package:ioul/utils/utils.dart';

import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../model/model.dart';
import '../screen_views/certificate_view.dart';

class Certificate extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Certificate({
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
  CertificateController createState() => CertificateController();
}

class CertificateController extends State<Certificate>
    with AutomaticKeepAliveClientMixin {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController certificateTypeController =
      TextEditingController();
  final TextEditingController centerNameController = TextEditingController();
  final TextEditingController centerNumberController = TextEditingController();
  final TextEditingController examNumberController = TextEditingController();
  final TextEditingController examYearController = TextEditingController();

  String selectedValue = "";

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  onNextPressed() {
    setState(() {
      widget.controller!.animateTo(6);
      widget.initialProgress!();
    });
  }

  onReversePressed() {
    setState(() {
      widget.controller!.animateTo(4);
      widget.decreaseProgress!();
    });
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CertificateView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  validateCertificateInfo() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final application = GlobalVariables.applications.value;

      application.candidateExamNumber = examNumberController.text.trim();
      application.examCenterName = centerNameController.text.trim();
      application.examCenterNumber = centerNumberController.text.trim();
      application.examYear = examYearController.text.trim();

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
