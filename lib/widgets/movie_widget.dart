import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w300_and_h450_bestv2/${movie.posterPath}',
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
