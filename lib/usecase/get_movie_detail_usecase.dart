import 'package:movie_db/model/movie.dart';

//parsing JSON to Data Type
MovieDetail createMovieDetail(var data) {
  var id = data["id"];
  String originalTitle = data["title"];
  var genreList = data['genres'] as List;
  List<Genre> genres = genreList.map((e) => Genre.fromJson(e)).toList();
  String synopsis = data["overview"];
  String posterPath = data["poster_path"];
  String backdropPath = data["backdrop_path"];
  var voteAverage = data["vote_average"];

  MovieDetail movieDetail = MovieDetail(id, originalTitle, genres, synopsis,
      posterPath, backdropPath, voteAverage);
  return movieDetail;
}
