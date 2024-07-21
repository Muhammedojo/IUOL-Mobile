import 'dart:io';
import '../../../../core/core.dart';
import '../bloc/bloc.dart';
import '../view/upload_view.dart';

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

  @override
  void initState() {
    super.initState();
    FilePicker.platform;
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
  Widget build(BuildContext context) {
    super.build(context);
    return UploadView(this);
  }

  Future<void> choosePassport(
      ImageSource source, TextEditingController controller) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      if (pickedFile.path.isNotEmpty) {
        final file = File(pickedFile.path);
        final fileSize = await file.length();
        if (!mounted) return;
        if (fileSize <= 1048576) {
          // 1 MB in bytes
          setState(() {
            passportImage = file;
          });
        } else {
          // File size exceeds the limit
          // You can show an error message or handle it as needed
          WidgetHelper.showToastError(context, "Image size exceed 1MB");
        }
      }
    }
  }

  Future<void> chooseDocument(TextEditingController controller) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      if (!mounted) return;
      if (file.extension == 'pdf') {
        setState(() {
          documentImage = File(file.path!);
        });
      } else {
        WidgetHelper.showToastError(context, "Selected file is not a PDF");
      }
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
