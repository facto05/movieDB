import '../model/movie.dart';

//parsing JSON to Data Type List
List<Movie> createPopularMovieList(List data) {
  List<Movie> list = [];
  for (int i = 0; i < 20; i++) {
    var id = data[i]["id"];
    String title = data[i]["title"];
    String posterPath = data[i]["poster_path"];
    String backdropImage = data[i]["backdrop_path"];
    String originalTitle = data[i]["original_title"];
    var voteAverage = data[i]["vote_average"];
    String overview = data[i]["overview"];
    String releaseDate = data[i]["release_date"];

    Movie movie = Movie(id, title, posterPath, backdropImage, originalTitle,
        voteAverage, overview, releaseDate);
    list.add(movie);
  }
  return list;
}
