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
    MovieDetail? movieDetail = await getMovieDetail(event.movieId);
    String genreList = '${movieDetail?.genres[0].id}';
    for (int i = 0; i < movieDetail!.genres.length; i++) {
      if (i > 0) {
        genreList += '%2C${movieDetail.genres[i].id}';
      }
    }
    List<Movie>? similarMovies = await getSimilarMovies(genreList);
    emit(MovieDetailState.formloadSuccess(movieDetail, similarMovies!));
  }
}
