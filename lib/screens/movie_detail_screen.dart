import 'package:cinematch/models/movie.dart';
import 'package:cinematch/widgets/movie_detail.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: Card(
                  elevation: 12.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: movie.posterPath != null
                      ? Image.network(
                          'https://image.tmdb.org/t/p/w300_and_h450_bestv2/${movie.posterPath}',
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.grey,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: SizedBox(
                  width: 320,
                  child: Text(
                    movie.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(),
              MovieDetail(movieId: movie.id),
            ],
          ),
        ));
  }
}
