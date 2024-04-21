import '../model/user.dart';
import '../screen_views/user_profile_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class UserProfile extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;
  final UserData user;

  const UserProfile({Key? key, required this.user}) : super(key: key);

  @override
  UserProfileController createState() => UserProfileController();
}

class UserProfileController extends State<UserProfile> {
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
  Widget build(BuildContext context) => UserProfileView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
