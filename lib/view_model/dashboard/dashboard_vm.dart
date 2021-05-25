import 'package:apex_blue_stack/model/user.dart';
import 'package:apex_blue_stack/service/recomendation_service.dart';
import 'package:apex_blue_stack/service/user_service.dart';
import 'package:apex_blue_stack/model/recomendation.dart';
import 'package:flutter/material.dart';

class DashboardVm extends ChangeNotifier {
  User user;
  Recomendation recom;

  void getAllData() async {
    await Future.wait([
      getUser(),
      getRecomentaion(),
    ]);
    notifyListeners();
  }

  Future<void> getUser() async {
    user = await UserService().getUser();
  }

  Future<void> getRecomentaion({String cursor}) async {
    Recomendation data =
        await RecomendationService().getRecomendations(nextCursor: cursor);
    if (recom == null) {
      recom = data;
      return;
    }
    recom.cursor = data.cursor;
    recom.tournaments.addAll(data.tournaments);
    notifyListeners();
  }
}
