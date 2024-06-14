import '../screen_views/user_profile_view.dart';
import 'package:flutter/material.dart';
import '../core/helpers/helper.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

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

  String extractLetters(String input) {
    if (input.isEmpty) {
      return '';
    }

    final firstSpaceIndex = input.indexOf(' ');

    if (firstSpaceIndex == -1 || firstSpaceIndex == input.length - 1) {
      return input.substring(0, 1);
    }

    return input.substring(0, 1) + input[firstSpaceIndex + 1];
  }
}
