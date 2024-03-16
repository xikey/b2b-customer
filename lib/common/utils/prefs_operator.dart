


import 'package:shared_preferences/shared_preferences.dart';
import '../../locator.dart';

class PrefsOperator {
  late SharedPreferences sharedPreferences;

  PrefsOperator() {
    sharedPreferences = locator<SharedPreferences>();
  }

  saveUserData(String token, String name, int code) async {
    sharedPreferences.setString("user_token", token);
    sharedPreferences.setString("user_name", name);
    sharedPreferences.setInt("user_code", code);
  }

  clearUserData(){
    sharedPreferences.setString("user_token", '');
    sharedPreferences.setString("user_name", '');
    sharedPreferences.setInt("user_code", 0);
  }

  getUserToken() async {
    final String? userToken = sharedPreferences.getString('user_token');
    return userToken;
  }

  getUserName() async {
    final String? userName = sharedPreferences.getString('user_name');
    return userName;
  }
}
