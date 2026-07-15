import 'package:movie_db/model/movie.dart';

class HomeState {
  final List<Movie> listNowPlayingMovie;
  final List<Movie> listPopularMovie;
  final bool isWatchlist;
  final bool isFavorite;
  final bool loading;
  final String? error;

  const HomeState._({
    this.listNowPlayingMovie = const [],
    this.listPopularMovie = const [],
    this.isWatchlist = false,
    this.isFavorite = false,
    this.loading = false,
    this.error,
  });

  HomeState.initial() : this._();

  HomeState copyWith({
    List<Movie>? listNowPlayingMovie,
    List<Movie>? listPopularMovie,
    bool? isWatchlist,
    bool? isFavorite,
    bool? loading,
    String? error,
  }) {
    return HomeState._(
      listNowPlayingMovie: listNowPlayingMovie ?? this.listNowPlayingMovie,
      listPopularMovie: listPopularMovie ?? this.listPopularMovie,
      isWatchlist: isWatchlist ?? this.isWatchlist,
      isFavorite: isFavorite ?? this.isFavorite,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}