import '../config/app_config.dart';
import '../model/movie.dart';
import 'api_client.dart';

Future<List<Movie>> getFavoriteMovies() async {
  final data = await ApiClient.get(
    '/account/${AppConfig.accountId}/favorite/movies',
    (json) => json,
  );
  final results = data['results'] as List;
  return results.map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
}