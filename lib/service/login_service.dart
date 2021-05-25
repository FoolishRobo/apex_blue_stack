import 'package:apex_blue_stack/enum/login_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    await registerMockUsers();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(username)) {
      if (prefs.getString(username) == password) {
        prefs.setBool("user_logged_in", true);
        return true;
      }
    }
    return false;
  }

  Future<LOGIN_STATUS> checkedLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("user_logged_in")) {
      if (prefs.getBool("user_logged_in")) {
        return LOGIN_STATUS.LoggedIn;
      }
    }
    return LOGIN_STATUS.LoggedOut;
  }

  Future logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("user_logged_in", false);
  }

  Future registerMockUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("9898989898") || !prefs.containsKey("9876543210")) {
      prefs.setString("9898989898", "password123");
      prefs.setString("9876543210", "password123");
    }
  }
}
