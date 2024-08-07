import 'package:movie_db/model/movie.dart';

class HomeState {
  List<Movie> listNowPlayingMovie;
  List<Movie> listPopularMovie;

  HomeState._(
      {this.listNowPlayingMovie = const [], this.listPopularMovie = const []});

  HomeState.initial() : this._();

  HomeState.formloadSuccess(this.listNowPlayingMovie, this.listPopularMovie);
}
