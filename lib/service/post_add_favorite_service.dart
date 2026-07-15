import '../config/app_config.dart';
import 'api_client.dart';

Future<bool> addFavoriteMovies(int movieId) async {
  final data = await ApiClient.post(
    '/account/${AppConfig.accountId}/favorite',
    {'media_type': 'movie', 'media_id': movieId, 'favorite': true},
    (json) => json['success'] as bool,
  );
  return data;
}