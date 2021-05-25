import 'package:apex_blue_stack/service/login_service.dart';
import 'package:flutter/material.dart';

class LoginVm extends ChangeNotifier {
  bool obscureText = true; // to toggle password visibility
  bool userNameError =
      false; // to show red bordered error in userName text field
  bool passwordError =
      false; // to show red bordered error in password text field
  bool isTextFieldValid =
      false; // to toggle submit button between active and disabled
  bool isLoggingIn =
      false; // to show loader widget while user is being logged in
  String errorText = ""; // to show proper error message;
  TextEditingController userName =
      TextEditingController(); // username text controller
  TextEditingController password =
      TextEditingController(); // password text controller

  set setObscureText(obscure) {
    obscureText = obscure; // toggling password visibility
    notifyListeners();
  }

  void setUserNameError(bool error, String errorText) {
    userNameError = error;
    errorText = errorText;
    notifyListeners();
  }

  void setPasswordError(error, String errorText) {
    passwordError = error;
    errorText = errorText;
    notifyListeners();
  }

  void validTextField() {
    // primary validation of text field to show active or disabled submit button accordingly
    if (userName.text.length >= 3 &&
        userName.text.length <= 11 &&
        password.text.length >= 3 &&
        password.text.length <= 11) {
      isTextFieldValid = true;
    } else {
      isTextFieldValid = false;
    }
    notifyListeners();
  }

  Future<bool> validate() async {
    // secondary validation with error when user clicks on the submit button
    if (userName.text.length == 0 || password.text.length == 0) {
      userNameError = userName.text.length == 0;
      passwordError = password.text.length == 0;
      errorText = "Username or Password can not be empty!";
      notifyListeners();
      return false;
    } else {
      if (userName.text.length < 3 || userName.text.length > 11) {
        userNameError = true;
        errorText =
            "Username can not be less than 3 characters and more than 11 characters long!";
        passwordError = false;
        notifyListeners();
        return false;
      } else if (password.text.length < 3 || password.text.length > 11) {
        passwordError = true;
        errorText =
            "Password can not be less than 3 characters and more than 11 characters long!";
        userNameError = false;
        notifyListeners();
        return false;
      }
    }
    isLoggingIn = true;
    bool success = await LoginService().login(userName.text, password.text);
    return success;
  }
}
