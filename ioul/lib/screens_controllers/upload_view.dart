import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../screen_views/application_form_view.dart';
import '../screen_views/upload_view.dart';

class Upload extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Upload({Key? key}) : super(key: key);

  @override
  UploadController createState() => UploadController();
}

class UploadController extends State<Upload>
    with AutomaticKeepAliveClientMixin {
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

  double initialProgress = (100 / 7 / 100);

  setProgress(int value) {
    setState(() {
      initialProgress = (100 / 7 * value / 100);
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
  Widget build(BuildContext context) => UploadView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  @override
  bool get wantKeepAlive => true;
}
