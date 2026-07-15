import '../config/app_config.dart';

class MovieDetail {
  final int id;
  final String originalTitle;
  final List<Genre> genres;
  final String synopsis;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;

  const MovieDetail({
    required this.id,
    required this.originalTitle,
    required this.genres,
    required this.synopsis,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'] as int,
      originalTitle: json['title'] as String? ?? '',
      genres: (json['genres'] as List)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      synopsis: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      backdropPath: json['backdrop_path'] as String? ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
    );
  }

  String get fullPosterPath => '${AppConfig.imageBaseUrl}$posterPath';
  String get fullBackdropPath => '${AppConfig.imageBaseUrl}$backdropPath';
}

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String originalTitle;
  final double voteAverage;
  final String overview;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.originalTitle,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      backdropPath: json['backdrop_path'] as String? ?? '',
      originalTitle: json['original_title'] as String? ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String? ?? '',
      releaseDate: json['release_date'] as String? ?? '',
    );
  }

  String get fullPosterPath => '${AppConfig.imageBaseUrl}$posterPath';
  String get fullBackdropPath => '${AppConfig.imageBaseUrl}$backdropPath';
}

class Genre {
  final int id;
  final String name;

  const Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['id'] as int, name: json['name'] as String);
  }
}