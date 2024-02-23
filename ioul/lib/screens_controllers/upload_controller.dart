import 'dart:io';
import 'package:ioul/bloc/bloc.dart';
import 'package:ioul/packages/package.dart';
import 'package:ioul/utils/utils.dart';
import '../helpers/helper.dart';
import '../model/model.dart';
import '../screen_views/upload_view.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;
  final int? selectedIndex;
  final TabController? controller;
  final Function? initialProgress;
  final Function? decreaseProgress;

  const Upload(
      {Key? key,
      this.selectedIndex,
      this.controller,
      this.initialProgress,
      this.decreaseProgress})
      : super(key: key);

  @override
  UploadController createState() => UploadController();
}

class UploadController extends State<Upload>
    with AutomaticKeepAliveClientMixin {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  bool checked = false;
  final picker = ImagePicker();
  final TextEditingController passportImageController = TextEditingController();
  final TextEditingController pdfDocumentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? passportImage;
  File? documentImage;

  double initialProgress = (100 / 7 / 100);

  setProgress(int value) {
    setState(() {
      initialProgress = (100 / 7 * value / 100);
    });
  }

  onNextPressed() {
    setState(() {
      widget.controller?.animateTo(6);
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
  Widget build(BuildContext context) => UploadView(this);

  Future choosePassport(
      ImageSource source, TextEditingController controller) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile!.path.isNotEmpty) {
      setState(() {
        passportImage = File(pickedFile.path);
      });
    }
  }

  Future chooseDocument(
      ImageSource source, TextEditingController controller) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile!.path.isNotEmpty) {
      setState(() {
        documentImage = File(pickedFile.path);
      });
    }
  }

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  toggleCheck() {
    setState(() {
      checked = !checked;
    });
  }

  validateUploads() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final application = GlobalVariables.applications.value;

      application.photo = passportImage?.path;
      //passportImageController.text;
      application.document = documentImage?.path;

      GlobalVariables().application = application;

      context
          .read<SubmitApplicationCubit>()
          .pushApplicationToServer(application);

      GlobalVariables.applications.value = SubmitApplication();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
