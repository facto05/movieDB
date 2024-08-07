import 'dart:convert';
import 'dart:io';

import 'package:movie_db/usecase/get_similar_movies_usecase.dart';

import '../model/movie.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>?> getSimilarMovies(String genreList) async {
  String movieUrl =
      'https://api.themoviedb.org/3/discover/movie?with_genres=$genreList';

  try {
    // Make the call
    var response = await http.get(Uri.parse(movieUrl), headers: {
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYWE4N2I0MzYzNzIwYzU0ZDI0YTc2YjA1MGI3MDMzYSIsIm5iZiI6MTcyMzAwMzA1Ny42NzYxMzYsInN1YiI6IjY2YjE4ZGU4ZDc0OWJhYTk4NTIyMTI5ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZrZ6BmTdCtWVxTvbyvhb135yFBo05FO4joj1Zi3D-K0'
    });
    if (response.statusCode == HttpStatus.ok) {
      // Decode the json response
      var data = jsonDecode(response.body);
      // Get result of API
      List movieList = data["results"];
      // Get the Movie list
      List<Movie> movies = createSimilarMovies(movieList);
      // Print the results.
      return movies;
    } else {
      print("Failed http call.");
    }
  } catch (exception) {
    print(exception.toString());
  }
  return null;
}
