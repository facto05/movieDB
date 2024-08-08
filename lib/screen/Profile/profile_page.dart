import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/screen/Profile/profile_bloc.dart';
import 'package:movie_db/screen/Profile/profile_event.dart';
import 'package:movie_db/screen/Profile/profile_state.dart';

import '../../widget/card_now_playing_movie.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(ProfilePageLoaded()),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Guest",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text("Guest")
                            ],
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Watchlist Movies',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        state.watchList.isNotEmpty
                            ? SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return cardNowPlayingMovieV2(
                                        state.watchList[index], context);
                                  },
                                  itemCount: state.watchList.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            : const SizedBox(
                                height: 100,
                                child: Center(
                                  widthFactor: 2,
                                  child: Text('No items founded'),
                                ),
                              ),
                        const Text(
                          'Favorite Movies',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        state.favouriteMovie.isNotEmpty
                            ? SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return cardNowPlayingMovieV2(
                                        state.favouriteMovie[index], context);
                                  },
                                  itemCount: state.favouriteMovie.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            : const SizedBox(
                                height: 100,
                                child: Center(
                                  widthFactor: 2,
                                  child: Text('No items founded'),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
