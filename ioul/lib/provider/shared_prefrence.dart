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
    print("Token value here 1");
    var user = await getUser();
    print("Token value here 2 :${user.token}");
    return user.token ?? "";
  }

  Future<void> saveTokenToPrefs(Login user) async {
    String userJsonString = jsonEncode(user.toJson());
    SharedPreferences prefs = await getPrefs();
    prefs.setString("token", userJsonString);
  }

  Future<Login> getUser() async {
    String? encodedUserString = await getString("token");
    print("Encoded User: $encodedUserString");

    if (encodedUserString != null && encodedUserString.isNotEmpty) {
      Map<String, dynamic> userJson = jsonDecode(encodedUserString);
      return Login.fromJson(userJson);
    }

    return Login();
  }
}
