import '../core/data/model/model.dart';
import '../features/assignments/presentation/view/assignment_preview_view.dart';
import 'package:flutter/material.dart';
import '../core/helpers/helper.dart';

class AssignmentPreview extends StatefulWidget {
  final AssignmentSummary? assignment;
  const AssignmentPreview({Key? key, this.assignment}) : super(key: key);

  @override
  AssignmentPreviewController createState() => AssignmentPreviewController();
}

class AssignmentPreviewController extends State<AssignmentPreview> {
  //... //Initialization code, state vars etc, all go here
  late Assignment? assignment;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AssignmentPreviewView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
