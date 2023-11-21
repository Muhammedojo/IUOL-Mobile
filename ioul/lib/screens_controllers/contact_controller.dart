import '../helpers/helper.dart';
import 'package:flutter/material.dart';
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

class ContactController extends State<Contact> with AutomaticKeepAliveClientMixin {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  final TextEditingController nokNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController middlenameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

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

  @override
  bool get wantKeepAlive => true;
}
