import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movieroulette/model/trending.dart';

class TrendApiClient {
  static const baseUrl =
      "https://api.themoviedb.org/3/trending/all/day?api_key=7f86e82a93102ee3f4105cdfcc96ac47&language=tr";
  final http.Client httpClient = http.Client();

  Future<Trending> getTrend() async {
    final trendUrl = baseUrl;
    final trendCevap = await httpClient.get(trendUrl);
    if (trendCevap.statusCode != 200) {
      throw Exception("Radyo  Apisi Geteirilemedi");
    }

    final radyoCevapJSON = jsonDecode(trendCevap.body);
    return Trending.fromJson(radyoCevapJSON);
  }
}
