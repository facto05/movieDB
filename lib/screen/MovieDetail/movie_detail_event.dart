sealed class MovieDetailEvent {}

class MovieDetailLoadedEvent extends MovieDetailEvent {
  int movieId;
  MovieDetailLoadedEvent(this.movieId);
}
