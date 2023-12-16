import 'dart:convert';
import 'package:http/http.dart';
import 'package:livefootball/model.dart';

class SoccerApi {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2020&league=39";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "PUT YOUR API KEY HERE OR IT WILL NOT WORK"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    Response res = await get(apiUrl as Uri, headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // for debugging
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    } else {
      throw Exception("Failed to load matches");
    }
  }
}
