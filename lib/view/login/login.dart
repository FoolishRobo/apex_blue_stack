import 'package:apex_blue_stack/constants/app_colors.dart';
import 'package:apex_blue_stack/constants/image_assets.dart';
import 'package:apex_blue_stack/view/dashboard/dashboard.dart';
import 'package:apex_blue_stack/view_model/login/login_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BLUE STACKS",
          style: TextStyle(
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: ChangeNotifierProvider<LoginVm>(
        create: (_) => LoginVm(),
        child: Consumer<LoginVm>(
          builder: (context, vm, child) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageAssets.appLogo,
                    height: 32,
                    color: AppColors.appColor,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: vm.userNameError
                                ? AppColors.error
                                : AppColors.appColor,
                            width: 1)),
                    child: Center(
                      child: TextField(
                        controller: vm.userName,
                        onChanged: (value) {
                          // resetting error messages if user makes any changes
                          vm.setUserNameError(false, "");
                          vm.setPasswordError(false, "");
                          // primary validation to show active or disabled submit button
                          vm.validTextField();
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: "UserName",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: vm.passwordError
                                ? AppColors.error
                                : AppColors.appColor,
                            width: 1)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: vm.password,
                            onChanged: (value) {
                              // resetting error messages if user makes any changes
                              vm.setUserNameError(false, "");
                              vm.setPasswordError(false, "");
                              // primary validation to show active or disabled submit button
                              vm.validTextField();
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: vm.obscureText,
                            decoration:
                                InputDecoration.collapsed(hintText: "Password"),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            vm.setObscureText = !vm.obscureText;
                          },
                          child: Icon(
                            vm.obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.appColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  vm.userNameError || vm.passwordError
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            vm.errorText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.error,
                              fontSize: 14,
                            ),
                          ),
                        )
                      : SizedBox(),
                  InkWell(
                    onTap: () async {
                      bool success = await vm
                          .validate(); // calling final validation to show errors if not valid
                      if (success) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()),
                            (route) => false);
                      } else {
                        Fluttertoast.showToast(msg: "Wrong username password");
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: vm.isTextFieldValid
                            ? AppColors.appGradient
                            : AppColors.appGradientDisabled,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Center(
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
