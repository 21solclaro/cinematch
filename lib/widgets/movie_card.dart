import 'package:cinematch/screens/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailScreen(movie: movie)));
      },
      child: Card(
        color: Colors.blue,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: movie.posterPath != null
            ? Image.network(
                'https://image.tmdb.org/t/p/w300_and_h450_bestv2/${movie.posterPath}',
                fit: BoxFit.cover,
              )
            : Container(color: Colors.grey),
      ),
    );
  }
}
