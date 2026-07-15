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
            appBar: AppBar(title: const Text('Profile')),
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : state.error != null
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
                            const SizedBox(height: 16),
                            Text('Error: ${state.error}', textAlign: TextAlign.center),
                            const SizedBox(height: 16),
                            FilledButton.icon(
                              onPressed: () => context.read<ProfileBloc>().add(ProfilePageLoaded()),
                              icon: const Icon(Icons.refresh),
                              label: const Text('Retry'),
                            ),
                          ],
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                                    child: const Icon(Icons.person, size: 32),
                                  ),
                                  const SizedBox(width: 16),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Guest', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                      Text('guest@moviedb.com'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: _sectionTitle(context, 'Watchlist Movies'),
                          ),
                          SliverToBoxAdapter(
                            child: state.watchList.isNotEmpty
                                ? SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          cardNowPlayingMovieV2(state.watchList[index], context),
                                      itemCount: state.watchList.length,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                : _emptyState('No watchlist items'),
                          ),
                          SliverToBoxAdapter(
                            child: _sectionTitle(context, 'Favorite Movies'),
                          ),
                          SliverToBoxAdapter(
                            child: state.favouriteMovie.isNotEmpty
                                ? SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) =>
                                          cardNowPlayingMovieV2(state.favouriteMovie[index], context),
                                      itemCount: state.favouriteMovie.length,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  )
                                : _emptyState('No favorite items'),
                          ),
                        ],
                      ),
          );
        },
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _emptyState(String text) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.grey[600])),
      ),
    );
  }
}