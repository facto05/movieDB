import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movie_db/model/movie.dart';
import 'package:movie_db/usecase/get_movie_detail_usecase.dart';

Future<MovieDetail?> getMovieDetail(int movieId) async {
  String movieDetail = 'https://api.themoviedb.org/3/movie/$movieId';

  try {
    // Make the call
    var response = await http.get(Uri.parse(movieDetail), headers: {
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYWE4N2I0MzYzNzIwYzU0ZDI0YTc2YjA1MGI3MDMzYSIsIm5iZiI6MTcyMzAwMzA1Ny42NzYxMzYsInN1YiI6IjY2YjE4ZGU4ZDc0OWJhYTk4NTIyMTI5ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZrZ6BmTdCtWVxTvbyvhb135yFBo05FO4joj1Zi3D-K0'
    });
    if (response.statusCode == HttpStatus.ok) {
      // Decode the json response
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      // Get the Movie list
      MovieDetail movie = createMovieDetail(data);
      // Print the results.
      return movie;
    } else {
      print("Failed http call.");
    }
  } catch (exception) {
    print(exception.toString());
  }
  return null;
}
