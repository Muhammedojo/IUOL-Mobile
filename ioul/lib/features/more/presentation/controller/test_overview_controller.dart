import '../../../../core/core.dart';
import '../view/test_overview_view.dart';
import 'test_list_controller.dart';

class TestOverview extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const TestOverview({Key? key}) : super(key: key);

  @override
  TestOverviewController createState() => TestOverviewController();
}

class TestOverviewController extends State<TestOverview> {
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
  Widget build(BuildContext context) => TestOverviewView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  goToTest() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TestList()),
      );
}
