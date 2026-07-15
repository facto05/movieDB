import 'package:movie_db/model/movie.dart';

class MovieDetailState {
  final MovieDetail? movieDetail;
  final List<Movie> similarMovie;
  final bool loading;
  final String? error;

  const MovieDetailState._({
    this.similarMovie = const [],
    this.movieDetail,
    this.loading = false,
    this.error,
  });

  MovieDetailState.initial() : this._();

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    List<Movie>? similarMovie,
    bool? loading,
    String? error,
  }) {
    return MovieDetailState._(
      movieDetail: movieDetail ?? this.movieDetail,
      similarMovie: similarMovie ?? this.similarMovie,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}