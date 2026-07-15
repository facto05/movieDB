import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/model/movie.dart';
import 'package:movie_db/screen/MovieDetail/movie_detail_event.dart';
import 'package:movie_db/screen/MovieDetail/movie_detail_state.dart';
import 'package:movie_db/service/get_movie_detail_service.dart';
import 'package:movie_db/service/get_similar_movies_serve.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailState.initial()) {
    on<MovieDetailEvent>(_onEvent);
  }

  Future<void> _onEvent(
      MovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    return switch (event) {
      final MovieDetailLoadedEvent e => _onPageLoaded(e, emit),
    };
  }

  Future<void> _onPageLoaded(
      MovieDetailLoadedEvent event, Emitter<MovieDetailState> emit) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final movieDetail = await getMovieDetail(event.movieId);
      if (movieDetail == null) {
        emit(state.copyWith(loading: false, error: 'Movie not found'));
        return;
      }
      final genreIds = movieDetail.genres.map((g) => g.id).join('%2C');
      final similarMovies = await getSimilarMovies(genreIds);
      emit(state.copyWith(
        movieDetail: movieDetail,
        similarMovie: similarMovies,
        loading: false,
      ));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}