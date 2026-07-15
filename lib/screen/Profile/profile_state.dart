import 'package:movie_db/model/movie.dart';

class ProfileState {
  final List<Movie> watchList;
  final List<Movie> favouriteMovie;
  final bool loading;
  final String? error;

  const ProfileState._({
    this.favouriteMovie = const [],
    this.watchList = const [],
    this.loading = false,
    this.error,
  });

  ProfileState.initial() : this._();

  ProfileState copyWith({
    List<Movie>? favouriteMovie,
    List<Movie>? watchList,
    bool? loading,
    String? error,
  }) {
    return ProfileState._(
      favouriteMovie: favouriteMovie ?? this.favouriteMovie,
      watchList: watchList ?? this.watchList,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}