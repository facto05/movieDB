import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/screen/Homepage/home_bloc.dart';
import 'package:movie_db/screen/Homepage/home_event.dart';
import 'package:movie_db/screen/MovieDetail/movie_detail_page.dart';
import '../model/movie.dart';

Widget cardNowPlayingMovie(Movie movie, BuildContext context) {
  return Container(
    width: 200,
    margin: const EdgeInsets.all(8),
    child: InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MovieDetailPage(movie.id)),
      ),
      borderRadius: BorderRadius.circular(12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                movie.fullPosterPath,
                width: 200,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: const Center(child: Icon(Icons.movie, size: 48)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: 18,
                  onPressed: () {
                    context.read<HomeBloc>().add(AddWatchlistEvent(movieId: movie.id));
                  },
                  icon: const Icon(Icons.bookmark_add_outlined),
                ),
                IconButton(
                  iconSize: 18,
                  onPressed: () {
                    context.read<HomeBloc>().add(AddFavoriteEvent(movieId: movie.id));
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
    margin: const EdgeInsets.all(8),
    child: InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MovieDetailPage(movie.id)),
      ),
      borderRadius: BorderRadius.circular(12),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                movie.fullPosterPath,
                width: 200,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: const Center(child: Icon(Icons.movie, size: 48)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}