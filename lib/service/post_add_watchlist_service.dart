import 'dart:convert';
import 'dart:io';

import 'package:movie_db/utils/constant.dart';

import 'package:http/http.dart' as http;

Future<bool> addWatchlistMovies(int movieId) async {
  String movieUrl =
      'https://api.themoviedb.org/3/account/${Constant.accountId}/watchlist';
  Map<String, dynamic> body = {
    "media_type": "movie",
    "media_id": movieId,
    "watchlist": true
  };

  try {
    // Make the call
    var response = await http.post(Uri.parse(movieUrl),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYWE4N2I0MzYzNzIwYzU0ZDI0YTc2YjA1MGI3MDMzYSIsIm5iZiI6MTcyMzAwMzA1Ny42NzYxMzYsInN1YiI6IjY2YjE4ZGU4ZDc0OWJhYTk4NTIyMTI5ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZrZ6BmTdCtWVxTvbyvhb135yFBo05FO4joj1Zi3D-K0',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
    if (response.statusCode == HttpStatus.created) {
      // Decode the json response
      var data = jsonDecode(response.body);
      // Parse JSON to bool
      bool isSuccess = data["success"];
      return isSuccess;
    } else {
      print("Failed http call.");
    }
  } catch (exception) {
    print(exception.toString());
  }
  return false;
}
