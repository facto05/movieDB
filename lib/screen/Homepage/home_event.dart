sealed class HomeEvent {}

class HomeLoadedEvent extends HomeEvent {
  HomeLoadedEvent();
}

class AddWatchlistEvent extends HomeEvent {
  int movieId;
  AddWatchlistEvent({required this.movieId});
}

class AddFavoriteEvent extends HomeEvent {
  int movieId;
  AddFavoriteEvent({required this.movieId});
}
