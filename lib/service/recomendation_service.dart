import 'dart:convert';

import 'package:apex_blue_stack/model/recomendation.dart';
import 'package:http/http.dart' as http;

class RecomendationService {
  Future<Recomendation> getRecomendations({String nextCursor}) async {
    Map<String, String> params;
    if (nextCursor != null) {
      params = {
        'limit': '10',
        'status': 'all',
        'cursor': nextCursor,
      };
    } else {
      params = {
        'limit': '10',
        'status': 'all',
      };
    }
    var url = Uri.https('tournaments-dot-game-tv-prod.uc.r.appspot.com',
        '/tournament/api/tournaments_list_v2', params);
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    Recomendation recom = Recomendation.fromJson(data["data"]);
    return recom;
  }
}
