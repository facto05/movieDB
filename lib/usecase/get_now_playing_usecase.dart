import '../model/movie.dart';

List<NowPlayingMovie> createNowPlayingMovieList(List data) {
  List<NowPlayingMovie> list = [];
  for (int i = 0; i < 6; i++) {
    var id = data[i]["id"];
    String title = data[i]["title"];
    String posterPath = data[i]["poster_path"];
    String backdropImage = data[i]["backdrop_path"];
    String originalTitle = data[i]["original_title"];
    var voteAverage = data[i]["vote_average"];
    String overview = data[i]["overview"];
    String releaseDate = data[i]["release_date"];

    NowPlayingMovie movie = NowPlayingMovie(id, title, posterPath,
        backdropImage, originalTitle, voteAverage, overview, releaseDate);
    list.add(movie);
  }
  return list;
}
