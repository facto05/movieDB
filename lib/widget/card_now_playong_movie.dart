import 'package:flutter/material.dart';

import '../model/movie.dart';

List<Widget> listNowPlayingMovie(List<NowPlayingMovie> list) {
  List<Widget> widgets = [];
  list.map((e) {
    widgets.add(cardNowPlayingMovie(e));
  });
  return widgets;
}

Widget cardNowPlayingMovie(NowPlayingMovie movie) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton.outlined(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_add_outlined)),
                IconButton.outlined(
                    onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
              ],
            )
          ],
        ),
      ),
      onTap: () {},
    ),
  );
}

Widget cardPopularMovie(PopularMovie movie) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton.outlined(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_add_outlined)),
                IconButton.outlined(
                    onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
              ],
            )
          ],
        ),
      ),
      onTap: () {},
    ),
  );
}
