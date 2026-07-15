import '../model/movie.dart';
import 'api_client.dart';

Future<List<Movie>> getSimilarMovies(String genreList) async {
  final data = await ApiClient.get('/discover/movie?with_genres=$genreList', (json) => json);
  final results = data['results'] as List;
  return results.map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
}