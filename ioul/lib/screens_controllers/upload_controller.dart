import 'dart:io';

import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../screen_views/upload_view.dart';
import 'package:image_picker/image_picker.dart';

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
  final picker = ImagePicker();
  final TextEditingController passportImageController = TextEditingController();
  final TextEditingController pdfDocumentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? passportImage;

  double initialProgress = (100 / 7 / 100);

  setProgress(int value) {
    setState(() {
      initialProgress = (100 / 7 * value / 100);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => UploadView(this);

  Future choosePassport(
      ImageSource source, TextEditingController controller) async {
    print('it 1');
    final pickedFile = await picker.pickImage(source: source);
    print('it 2');
    if (pickedFile!.path.isNotEmpty) {
      setState(() {
        passportImage = File(pickedFile.path);
      });
    }
  }

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  @override
  bool get wantKeepAlive => true;
}
