import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/model/movie.dart';
import 'package:movie_db/screen/Profile/profile_event.dart';
import 'package:movie_db/screen/Profile/profile_state.dart';
import 'package:movie_db/service/get_watchlist_service.dart';

import '../../service/get_favorite_service.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<ProfileEvent>(_onEvent);
  }

  Future<void> _onEvent(ProfileEvent event, Emitter<ProfileState> emit) async {
    return switch (event) {
      final ProfilePageLoaded e => _onPageLoaded(e, emit)
    };
  }

  Future<void> _onPageLoaded(
      ProfilePageLoaded event, Emitter<ProfileState> emit) async {
    List<Movie> watchListMovie = await getWatchListMovies() ?? [];
    List<Movie> favoriteMovie = await getFavoriteMovies() ?? [];
    emit(ProfileState.formLoadSuccess(favoriteMovie, watchListMovie));
  }
}
