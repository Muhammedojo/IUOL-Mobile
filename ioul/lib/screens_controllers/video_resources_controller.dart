import '../screen_views/video_resources_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class VideoResources extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const VideoResources({Key? key}) : super(key: key);

  @override
  VideoResourcesController createState() => VideoResourcesController();
}

class VideoResourcesController extends State<VideoResources> {

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
  Widget build(BuildContext context) => VideoResourcesView(this);

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