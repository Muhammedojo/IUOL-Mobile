import '../screen_views/document_resources_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class DocumentResources extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const DocumentResources({Key? key}) : super(key: key);

  @override
  DocumentResourcesController createState() => DocumentResourcesController();
}

class DocumentResourcesController extends State<DocumentResources> {

  //... //Initialization code, state vars etc, all go here
  int selectedPeriod = 0;
  String selectedPeriodType = "First Study Period";
  List<String> periodType = [
    "First Study Period",
    "Second Study Period",
    "Third Study Period",
  ];

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => DocumentResourcesView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

  onChipSelected(int index) {
    // print("new index: $index");
    setState(() {
      selectedPeriod = index;
    });
  }

}