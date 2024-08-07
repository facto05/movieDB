import 'dart:convert';
import 'dart:io';

import 'package:movie_db/usecase/get_popular_movie_usecase.dart';

import '../model/movie.dart';
import '../utils/constant.dart';

Future<List<PopularMovie>?> getPopularMovies() async {
  const String nowPlaying =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constant.API_KEY}&page=1';

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
      List<PopularMovie> movieList = createPopularMovieList(results);
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
