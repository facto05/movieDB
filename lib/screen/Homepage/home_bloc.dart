import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/model/movie.dart';
import 'package:movie_db/screen/Homepage/home_event.dart';
import 'package:movie_db/screen/Homepage/home_state.dart';
import 'package:movie_db/service/get_now_playing_service.dart';
import 'package:movie_db/service/get_popular_movies_service.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>(_onEvent);
  }
  Future<void> _onEvent(HomeEvent event, Emitter<HomeState> emit) async {
    return switch (event) { final HomeLoadedEvent e => _onPageLoaded(e, emit) };
  }

  Future<void> _onPageLoaded(
      HomeLoadedEvent event, Emitter<HomeState> emit) async {
    List<NowPlayingMovie> listNowPlayingMovie =
        await getNowPlayingMovies() ?? [];
    List<PopularMovie> listPopularMovie = await getPopularMovies() ?? [];
    emit(HomeState.formloadSuccess(listNowPlayingMovie, listPopularMovie));
  }
}
