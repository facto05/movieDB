//Model for Movie Detail

class MovieDetail {
  int id;
  final String originalTitle;
  final List<Genre> genres;
  final String synopsis;
  final String posterPath;
  final String backdropPath;
  double voteAverage;

  MovieDetail(this.id, this.originalTitle, this.genres, this.synopsis,
      this.posterPath, this.backdropPath, this.voteAverage);
}

//Model for List Movie
class Movie {
  int id;
  String title;
  String posterPath;
  String backdropPath;
  String originalTitle;
  double voteAverage;
  String overview;
  String releaseDate;

  Movie(this.id, this.title, this.posterPath, this.backdropPath,
      this.originalTitle, this.voteAverage, this.overview, this.releaseDate);
}

//Model for Genre
class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});
  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json["id"], name: json["name"]);
  }
}
