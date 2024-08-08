import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/model/movie.dart';
import 'package:movie_db/screen/Homepage/home_event.dart';
import 'package:movie_db/screen/Homepage/home_state.dart';
import 'package:movie_db/service/get_now_playing_service.dart';
import 'package:movie_db/service/get_popular_movies_service.dart';
import 'package:movie_db/service/post_add_favorite_service.dart';

import '../../service/post_add_watchlist_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>(_onEvent);
  }
  Future<void> _onEvent(HomeEvent event, Emitter<HomeState> emit) async {
    return switch (event) {
      final HomeLoadedEvent e => _onPageLoaded(e, emit),
      final AddWatchlistEvent e => _onAddWatchlistEvent(e, emit),
      final AddFavoriteEvent e => _onAddFavoriteEvent(e, emit)
    };
  }

  Future<void> _onPageLoaded(
      HomeLoadedEvent event, Emitter<HomeState> emit) async {
    List<Movie> listNowPlayingMovie = await getNowPlayingMovies() ?? [];
    List<Movie> listPopularMovie = await getPopularMovies() ?? [];
    emit(HomeState.formloadSuccess(listNowPlayingMovie, listPopularMovie));
  }

  Future<void> _onAddWatchlistEvent(
      AddWatchlistEvent event, Emitter<HomeState> emit) async {
    try {
      bool isWatchlist = await addWatchlistMovies(event.movieId);
      emit(state.copyWith(isWatchlist: isWatchlist));
      emit(state.copyWith(isWatchlist: false));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _onAddFavoriteEvent(
      AddFavoriteEvent event, Emitter<HomeState> emit) async {
    try {
      bool isFavorite = await addFavoriteMovies(event.movieId);
      emit(state.copyWith(isFavorite: isFavorite));
      emit(state.copyWith(isFavorite: false));
    } catch (e) {
      rethrow;
    }
  }
}
