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
      create: (context) =>
          MovieDetailBloc()..add(MovieDetailLoadedEvent(movieId)),
      child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state.movieDetail != null) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.movieDetail?.originalTitle ?? ''),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      Container(
                        color: Colors.amber,
                        child: Opacity(
                          opacity: 0.8,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${state.movieDetail?.backdropPath}',
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 200,
                          height: 200,
                          child: Image.network(
                              'https://image.tmdb.org/t/p/w500/${state.movieDetail?.posterPath}'),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.movieDetail?.originalTitle ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_border_outlined,
                                color: Colors.black,
                              ),
                              Text(
                                '${state.movieDetail?.voteAverage.ceil()}/10',
                                style: const TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          const Text(
                            'Synopsis :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            state.movieDetail?.synopsis ?? '',
                            softWrap: true,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            "Similar Movies",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return cardNowPlayingMovieV2(
                                    state.similarMovie[index], context);
                              },
                              itemCount: state.similarMovie.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
