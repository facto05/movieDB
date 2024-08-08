import 'package:movie_db/model/movie.dart';

class HomeState {
  List<Movie> listNowPlayingMovie;
  List<Movie> listPopularMovie;
  bool isWatchlist = false;
  bool isFavorite = false;

  HomeState._(
      {this.listNowPlayingMovie = const [],
      this.listPopularMovie = const [],
      this.isWatchlist = false,
      this.isFavorite = false});

  HomeState.initial() : this._();

  HomeState.formloadSuccess(this.listNowPlayingMovie, this.listPopularMovie);

  HomeState copyWith(
      {List<Movie>? nomPlayingMovie,
      List<Movie>? popularMovie,
      bool? isWatchlist,
      bool? isFavorite}) {
    return HomeState._(
        listNowPlayingMovie: nomPlayingMovie ?? listNowPlayingMovie,
        listPopularMovie: popularMovie ?? listPopularMovie,
        isWatchlist: isWatchlist ?? this.isWatchlist,
        isFavorite: isFavorite ?? this.isFavorite);
  }
}
