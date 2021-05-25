import 'package:apex_blue_stack/constants/app_colors.dart';
import 'package:apex_blue_stack/view/landing_page.dart';
import 'package:apex_blue_stack/view_model/dashboard/dashboard_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardVm>(
      create: (_) => DashboardVm(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: AppColors.appColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LandingPage(),
      ),
    );
  }
}
