import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../screen_views/programme_view.dart';

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

class ProgrammeController extends State<Programme> with AutomaticKeepAliveClientMixin {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  final TextEditingController firstNameController = TextEditingController();
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

  @override
  bool get wantKeepAlive => true;
}
