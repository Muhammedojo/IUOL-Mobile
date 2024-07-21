import '../../../../core/core.dart';
import '../view/more_view.dart';

class More extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const More({Key? key}) : super(key: key);

  @override
  MoreController createState() => MoreController();
}

class MoreController extends State<More> {
  //... //Initialization code, state vars etc, all go here

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MoreView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
