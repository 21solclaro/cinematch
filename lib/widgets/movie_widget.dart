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
          movie.posterPath != null
              ? Image.network(
                  'https://image.tmdb.org/t/p/w300_and_h450_bestv2/${movie.posterPath}',
                  fit: BoxFit.cover,
                  height: 200,
                )
              : Container(
                  height: 200,
                  color: Colors.grey,
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
