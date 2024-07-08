import 'package:ioul/core/utils/utils.dart';
import '../../../../core/helpers/helper.dart';
import 'package:flutter/material.dart';
import '../view/contact_view.dart';

class Contact extends StatefulWidget {
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
  Widget build(BuildContext context) {
    super.build(context);
    return ContactView(this);
  }

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  validateContactInfo() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      String phone = nokPhoneController.text.trim();
      String refPhone = refPhoneController.text.trim();
      String nokEmail = nokEmailController.text.trim();
      String refEmail = refEmailController.text.trim();

      if (!WidgetHelper().isValidEmail(nokEmail)) {
        WidgetHelper.showToastError(context, "invalid_email");
        return;
      }

      if (phone.isEmpty || phone.length < 10) {
        WidgetHelper.showToastError(context, 'incorrect_phone_no');
        return;
      }
      if (!WidgetHelper().isValidEmail(refEmail)) {
        WidgetHelper.showToastError(context, "invalid_email");
        return;
      }
      if (refPhone.isEmpty || refPhone.length < 10) {
        WidgetHelper.showToastError(context, 'incorrect_phone_no');
        return;
      }

      final application = GlobalVariables.applications.value;

      application.nokAddress = nokAddressController.text.trim();
      application.nokEmail = nokEmailController.text.trim();
      application.nokName = nokNameController.text.trim();
      application.nokPhone = nokPhoneController.text.trim();
      application.nokEmail = nokEmailController.text.trim();
      application.refereeAddress = refAddressController.text.trim();
      application.refereeEmail = refEmailController.text.trim();
      application.refereeName = refNameController.text.trim();
      application.refereePhone = refPhoneController.text.trim();

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
