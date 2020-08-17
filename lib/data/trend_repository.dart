import 'package:movieroulette/data/trend_api_client.dart';
import 'package:movieroulette/model/trending.dart';


class TrendRepository {
 TrendApiClient radyoApiClient = TrendApiClient();

  Future<Trending> getWeather() async {
    return await radyoApiClient.getTrend();
  }
}