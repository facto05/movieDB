import '../config/app_config.dart';
import 'api_client.dart';

Future<bool> addWatchlistMovies(int movieId) async {
  final data = await ApiClient.post(
    '/account/${AppConfig.accountId}/watchlist',
    {'media_type': 'movie', 'media_id': movieId, 'watchlist': true},
    (json) => json['success'] as bool,
  );
  return data;
}