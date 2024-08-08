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
        child: Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Show Poster Movie
              Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                width: 200,
                height: 250,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Button Add Watchlist
                  IconButton.outlined(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(AddWatchlistEvent(movieId: movie.id));
                      },
                      icon: const Icon(Icons.bookmark_add_outlined)),
                  //Button Add Favorite
                  IconButton.outlined(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(AddFavoriteEvent(movieId: movie.id));
                      },
                      icon: const Icon(Icons.favorite_outline)),
                ],
              )
            ],
          ),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailPage(movie.id),
            ))),
  );
}

//Without add wishlist & favorite button
Widget cardNowPlayingMovieV2(Movie movie, BuildContext context) {
  return Container(
    width: 200,
    margin: const EdgeInsets.all(10),
    child: InkWell(
        child: Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                width: 200,
                height: 250,
              ),
            ],
          ),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailPage(movie.id),
            ))),
  );
}
