import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/screen/Homepage/home_bloc.dart';
import 'package:movie_db/screen/Homepage/home_event.dart';
import 'package:movie_db/widget/card_now_playing_movie.dart';

import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc()..add(HomeLoadedEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.listNowPlayingMovie.isEmpty) {
              return Container(
                color: Colors.white,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.amber,
                )),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text('MovieDB'),
                  actions: [
                    IconButton.filled(
                        onPressed: () {}, icon: const Icon(Icons.people))
                  ],
                ),
                body: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Now Playing',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        height: 330,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return cardNowPlayingMovie(
                                state.listNowPlayingMovie[index], context);
                          },
                          itemCount: state.listNowPlayingMovie.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const Text(
                        'Popular Movie',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        height: 330,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return cardNowPlayingMovie(
                                state.listPopularMovie[index], context);
                          },
                          itemCount: state.listPopularMovie.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
