class AppConfig {
  AppConfig._();

  static const String apiKey = String.fromEnvironment('TMDB_API_KEY');
  static const String bearerToken = String.fromEnvironment('TMDB_BEARER_TOKEN');
  static const int accountId = int.fromEnvironment('TMDB_ACCOUNT_ID', defaultValue: 21425614);

  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
}