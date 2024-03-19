import 'package:cinematch/providers/movie_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetail extends ConsumerWidget {
  const MovieDetail({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetails = ref.watch(movieDetailsProvider(movieId));

    return movieDetails.when(
      data: (movie) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              movie.genres != null && movie.genres!.isNotEmpty
                  ? Wrap(
                      spacing: 4.0,
                      children: movie.genres!
                          .map(
                            (genre) => Chip(
                              label: Text(genre!),
                              labelStyle: const TextStyle(color: Colors.white),
                              backgroundColor: Colors.blueGrey,
                              padding: EdgeInsets.zero,
                            ),
                          )
                          .toList(),
                    )
                  : const Text('It has no genres.'),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'Original Title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              movie.originalTitle != null
                  ? Text(movie.originalTitle!)
                  : const Text('null'),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'Runtime',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              movie.runtime != null
                  ? Text('${movie.runtime!.toString()} min')
                  : const Text('-'),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'Release Date',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              movie.releaseDate != null
                  ? Text(movie.releaseDate!)
                  : const Text('-'),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                'Overview',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              movie.overview != null ? Text(movie.overview!) : const Text('-'),
            ],
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('An error occurred: $error')),
    );
  }
}
