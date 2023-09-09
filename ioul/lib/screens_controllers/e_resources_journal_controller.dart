import '../screen_views/e_resources_journal_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class EResources extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const EResources({Key? key}) : super(key: key);

  @override
  EResourcesController createState() => EResourcesController();
}

class EResourcesController extends State<EResources> {

  //... //Initialization code, state vars etc, all go here
  TextEditingController searchController = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => EResourcesView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}