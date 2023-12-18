import '../screen_views/take_test_view.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';

class TakeTest extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const TakeTest({Key? key}) : super(key: key);

  @override
  TakeTestController createState() => TakeTestController();
}

class TakeTestController extends State<TakeTest> {

  //... //Initialization code, state vars etc, all go here

  @override
  void initState(){
    secureScreen();
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TakeTestView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
}