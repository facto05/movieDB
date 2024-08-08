import 'package:movie_db/model/movie.dart';

class ProfileState {
  List<Movie> watchList;
  List<Movie> favouriteMovie;

  ProfileState._({this.favouriteMovie = const [], this.watchList = const []});
  ProfileState.initial() : this._();
  ProfileState.formLoadSuccess(this.favouriteMovie, this.watchList);
}
