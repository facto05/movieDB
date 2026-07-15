import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/screen/Homepage/home_bloc.dart';
import 'package:movie_db/screen/Homepage/home_event.dart';
import 'package:movie_db/screen/MovieDetail/movie_detail_page.dart';
import '../model/movie.dart';

Widget cardNowPlayingMovie(Movie movie, BuildContext context) {
  return Container(
    width: 200,
    margin: const EdgeInsets.all(10),
    child: InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MovieDetailPage(movie.id)),
      ),
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.network(
                movie.fullPosterPath,
                width: 200,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 200,
                  height: 250,
                  color: Colors.grey[300],
                  child: const Icon(Icons.movie, size: 60),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton.outlined(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(AddWatchlistEvent(movieId: movie.id));
                  },
                  icon: const Icon(Icons.bookmark_add_outlined),
                ),
                IconButton.outlined(
                  onPressed: () {
                    context
                        .read<HomeBloc>()
                        .add(AddFavoriteEvent(movieId: movie.id));
                  },
                  icon: const Icon(Icons.favorite_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget cardNowPlayingMovieV2(Movie movie, BuildContext context) {
  return Container(
    width: 200,
    margin: const EdgeInsets.all(10),
    child: InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MovieDetailPage(movie.id)),
      ),
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.network(
                movie.fullPosterPath,
                width: 200,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 200,
                  height: 250,
                  color: Colors.grey[300],
                  child: const Icon(Icons.movie, size: 60),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}