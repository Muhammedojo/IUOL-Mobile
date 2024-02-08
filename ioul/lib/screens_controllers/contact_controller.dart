import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../model/model.dart';
import '../screen_views/contact_view.dart';

class Contact extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Contact({
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
  ContactController createState() => ContactController();
}

class ContactController extends State<Contact>
    with AutomaticKeepAliveClientMixin {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nokNameController = TextEditingController();
  final TextEditingController nokEmailController = TextEditingController();
  final TextEditingController nokAddressController = TextEditingController();
  final TextEditingController refEmailController = TextEditingController();
  final TextEditingController nokPhoneController = TextEditingController();
  final TextEditingController refNameController = TextEditingController();
  final TextEditingController refPhoneController = TextEditingController();
  final TextEditingController refAddressController = TextEditingController();

  String selectedValue = "";

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  onNextPressed() {
    setState(() {
      widget.controller!.animateTo(3);
      widget.initialProgress!();
    });
  }

  onReversePressed() {
    setState(() {
      widget.controller!.animateTo(1);
      widget.decreaseProgress!();
    });
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ContactView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  validateContactInfo() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final application = SubmitApplication();

      application.nokAddress = nokAddressController.text.trim();
      application.nokEmail = nokEmailController.text.trim();
      application.nokName = nokNameController.text.trim();
      application.nokPhone = nokPhoneController.text.trim();
      application.nokEmail = nokEmailController.text.trim();
      application.refereeAddress = refAddressController.text.trim();
      application.refereeEmail = refEmailController.text.trim();
      application.refereeName = refNameController.text.trim();
      application.refereePhone = refPhoneController.text.trim();

      onNextPressed();
    } else {
      WidgetHelper.showToastError(context, "Fill required field.");
      return;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
