import 'dart:developer';

import '../../../../core/core.dart';
import '../view/home_view.dart';

class Home extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;
  final StatefulNavigationShell navigationShell;

  const Home({Key? key, required this.navigationShell}) : super(key: key);

  @override
  HomeController createState() => HomeController();
}

class HomeController extends State<Home> {
  //... //Initialization code, state vars etc, all go here
  bool isupdateModal = false;
  // AppUpdateInfo? updateInfo;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  Future<void> checkForUpdate() async {
    //log('checking for update', name: 'inapp update');
    try {
      final updateInfo = await InAppUpdate.checkForUpdate();
      // log(updateInfo.updateAvailability.toString(), name: 'inapp update');
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        isupdateModal = true;
        await InAppUpdate.startFlexibleUpdate();
        isupdateModal = false;
      }
    } catch (e) {
      showSnack(e.toString());
      // log(e.toString(), name: 'inapp update');
    }
  }

  void showSnack(String text) {
    if (scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  int selectedPage = 0;

  @override
  void initState() {
    super.initState();
    checkForUpdate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => HomeView(this);

  void setCurrentIndex(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  logoutUser() async {
    try {
      WidgetHelper.showProgress(text: 'logging_out'.tr());

      var response = await repository.logout();

      WidgetHelper.hideProgress();

      if (!mounted) return;
      if (response.isConnectionSuccessful()) {
        await clearUserData();
        if (!mounted) return;
        context.goNamed(RouteConstants.login);
      } else {
        WidgetHelper.showToastError(context, '${response.message}');
        return;
      }
    } catch (e) {
      WidgetHelper.hideProgress();
      WidgetHelper.showToastError(context, 'An error occurred during logout');
    } finally {
      WidgetHelper.hideProgress(); // Ensure progress is hidden
    }
  }

  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
