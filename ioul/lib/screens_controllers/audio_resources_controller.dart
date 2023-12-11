import '../screen_views/audio_resources_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class AudioResources extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const AudioResources({Key? key}) : super(key: key);

  @override
  AudioResourcesController createState() => AudioResourcesController();
}

class AudioResourcesController extends State<AudioResources> {

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
  Widget build(BuildContext context) => AudioResourcesView(this);

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