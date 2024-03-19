import 'package:ioul/utils/utils.dart';
import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../screen_views/sponsor_view.dart';

class Sponsor extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Sponsor({
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
  SponsorController createState() => SponsorController();
}

class SponsorController extends State<Sponsor>
   {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController sponsorController = TextEditingController();
  final TextEditingController sponsorNameController = TextEditingController();
  final TextEditingController sponsorAddressController =
      TextEditingController();

  String selectedValue = "";

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  onNextPressed() {
    setState(() {
      widget.controller!.animateTo(4);
      widget.initialProgress!();
    });
  }

  onReversePressed() {
    setState(() {
      widget.controller!.animateTo(2);
      widget.decreaseProgress!();
    });
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SponsorView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  validateSponsorInfo() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final application = GlobalVariables.applications.value;

      application.sponsorAddress = sponsorAddressController.text.trim();
      application.sponsorName = sponsorNameController.text.trim();
      application.sponsorType = sponsorController.text.trim();

      GlobalVariables.applications.value = application;

      onNextPressed();
    } else {
      WidgetHelper.showToastError(context, "Fill required field.");
      return;
    }
  }

  
}
