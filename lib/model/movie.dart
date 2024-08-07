//to clasify JSON Data to Model for Movie Detail
class MovieDetail {
  int id;
  final String originalTitle;
  final List<String> genres;
  final String synopsis;
  final String posterPath;
  final String backdropPath;
  double voteAverage;

  MovieDetail(this.id, this.originalTitle, this.genres, this.synopsis,
      this.posterPath, this.backdropPath, this.voteAverage);
}

//to clasify JSON Data to Model for Now Playing Movie
class NowPlayingMovie {
  int id;
  String title;
  String posterPath;
  String backdropPath;
  String originalTitle;
  double voteAverage;
  String overview;
  String releaseDate;

  NowPlayingMovie(this.id, this.title, this.posterPath, this.backdropPath,
      this.originalTitle, this.voteAverage, this.overview, this.releaseDate);
}

//to clasify JSON Data to Model for Popular Movie
class PopularMovie {
  int id;
  String title;
  String posterPath;
  String backdropPath;
  String originalTitle;
  double voteAverage;
  String overview;
  String releaseDate;

  PopularMovie(this.id, this.title, this.posterPath, this.backdropPath,
      this.originalTitle, this.voteAverage, this.overview, this.releaseDate);
}
