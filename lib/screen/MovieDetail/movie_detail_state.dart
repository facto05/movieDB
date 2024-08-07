import 'package:movie_db/model/movie.dart';

class MovieDetailState {
  MovieDetail? movieDetail;
  List<Movie> similarMovie;

  MovieDetailState._({this.similarMovie = const [], this.movieDetail});
  MovieDetailState.initial() : this._();
  MovieDetailState.formloadSuccess(this.movieDetail, this.similarMovie);
}
