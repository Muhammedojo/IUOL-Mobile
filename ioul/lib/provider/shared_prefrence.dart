import 'dart:convert';

import '../model/model.dart';
import '../packages/package.dart';

class AppPrefs {
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> getToken() async {
    var user = await getUser();
    return user.token ?? "";
  }

  Future<String?> getString(String key) async {
    return await getPrefs().then((pref) {
      return pref.getString(key);
    });
  }

  Future<Login> getUser() async {
    String? encodedUser = await getString("token");
    if (encodedUser != null && encodedUser.isNotEmpty) {
      return Login.fromJson(jsonDecode(encodedUser));
    }
    return Login();
  }
}
