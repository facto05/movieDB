import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/screen/MovieDetail/movie_detail_bloc.dart';
import 'package:movie_db/screen/MovieDetail/movie_detail_event.dart';
import 'package:movie_db/screen/MovieDetail/movie_detail_state.dart';
import '../../widget/card_now_playing_movie.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage(this.movieId, {super.key});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailBloc()..add(MovieDetailLoadedEvent(movieId)),
      child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state.loading) {
            return Scaffold(
              body: const Center(child: CircularProgressIndicator()),
            );
          }

          if (state.error != null) {
            return Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error: ${state.error}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context
                          .read<MovieDetailBloc>()
                          .add(MovieDetailLoadedEvent(movieId)),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          final movie = state.movieDetail;
          if (movie == null) {
            return const Scaffold(body: Center(child: Text('No data')));
          }

          return Scaffold(
            appBar: AppBar(title: Text(movie.originalTitle)),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Image.network(
                      movie.fullBackdropPath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 200,
                        color: Colors.grey[300],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        width: 200,
                        height: 200,
                        child: Image.network(
                          movie.fullPosterPath,
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.movie, size: 80),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.originalTitle,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star_border_outlined),
                            Text('${movie.voteAverage.ceil()}/10'),
                          ],
                        ),
                        const Text('Synopsis',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(movie.synopsis),
                        const SizedBox(height: 50),
                        const Text('Similar Movies',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemBuilder: (context, index) =>
                                cardNowPlayingMovieV2(
                                    state.similarMovie[index], context),
                            itemCount: state.similarMovie.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}