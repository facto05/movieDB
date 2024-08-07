import 'dart:convert';
import 'dart:io';

import '../model/movie.dart';
import '../usecase/get_now_playing_usecase.dart';
import '../utils/constant.dart';

Future<List<Movie>?> getNowPlayingMovies() async {
  const String nowPlaying =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constant.API_KEY}&page=1';

  var httpClient = HttpClient();
  try {
    // Make the call
    var request = await httpClient.getUrl(Uri.parse(nowPlaying));
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var jsonResponse = await response.transform(utf8.decoder).join();
      // Decode the json response
      var data = jsonDecode(jsonResponse);
      // Get the result list
      List results = data["results"];
      // Get the Movie list
      List<Movie> movieList = createNowPlayingMovieList(results);
      // Print the results.
      return movieList;
    } else {
      print("Failed http call.");
    }
  } catch (exception) {
    print(exception.toString());
  }
  return null;
}
