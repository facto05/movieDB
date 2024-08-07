import 'package:movie_db/model/movie.dart';

class HomeState {
  List<NowPlayingMovie> listNowPlayingMovie;
  List<PopularMovie> listPopularMovie;

  HomeState._(
      {this.listNowPlayingMovie = const [], this.listPopularMovie = const []});

  HomeState.initial() : this._();

  HomeState.formloadSuccess(this.listNowPlayingMovie, this.listPopularMovie);
}
