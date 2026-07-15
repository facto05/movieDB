import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/screen/Homepage/home_bloc.dart';
import 'package:movie_db/screen/Homepage/home_event.dart';
import 'package:movie_db/screen/Profile/profile_page.dart';
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
      child: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.loading && state.listNowPlayingMovie.isEmpty) {
            return Scaffold(
              body: const Center(child: CircularProgressIndicator()),
            );
          }

          if (state.error != null && state.listNowPlayingMovie.isEmpty) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error: ${state.error}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<HomeBloc>().add(HomeLoadedEvent()),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('MovieDB'),
              actions: [
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  ),
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () async => context.read<HomeBloc>().add(HomeLoadedEvent()),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('Now Playing'),
                    SizedBox(
                      height: 330,
                      child: ListView.builder(
                        itemBuilder: (context, index) => cardNowPlayingMovie(
                            state.listNowPlayingMovie[index], context),
                        itemCount: state.listNowPlayingMovie.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    _sectionTitle('Popular Movie'),
                    SizedBox(
                      height: 330,
                      child: ListView.builder(
                        itemBuilder: (context, index) => cardNowPlayingMovie(
                            state.listPopularMovie[index], context),
                        itemCount: state.listPopularMovie.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state.isWatchlist) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Added to Watchlist')));
          } else if (state.isFavorite) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Added to Favorite')));
          }
        },
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );
  }
}