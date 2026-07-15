import '../model/movie.dart';
import 'api_client.dart';

Future<List<Movie>> getNowPlayingMovies() async {
  final data = await ApiClient.get('/movie/now_playing?page=1', (json) => json);
  final results = data['results'] as List;
  return results.map((e) => Movie.fromJson(e as Map<String, dynamic>)).toList();
}