import 'dart:convert';

import '../model/model.dart';
import '../packages/package.dart';

class AppPrefs {
  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getString(String key) async {
    return (await getPrefs()).getString(key);
  }

  Future<String> getToken() async {
    // var user = await getUser();
    return getPrefs().then((value) => value.getString("token") ?? "");
  }

  Future<void> saveTokenToPrefs(LoginData user) async {
    // String userJsonString = jsonEncode(user.toJson());
    SharedPreferences prefs = await getPrefs();
    prefs.setString("token", user.token ?? "");
  }

  Future<LoginData> getUser() async {
    String? encodedUserString = await getString("token");

    if (encodedUserString != null && encodedUserString.isNotEmpty) {
      Map<String, dynamic> userJson = jsonDecode(encodedUserString);
      return LoginData.fromJson(userJson);
    }

    return LoginData();
  }
}
