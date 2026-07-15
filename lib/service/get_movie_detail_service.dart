import '../model/movie.dart';
import 'api_client.dart';

Future<MovieDetail?> getMovieDetail(int movieId) async {
  try {
    return await ApiClient.get('/movie/$movieId', (json) => MovieDetail.fromJson(json));
  } catch (_) {
    return null;
  }
}