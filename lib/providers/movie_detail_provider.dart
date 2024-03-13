import 'package:cinematch/models/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDetailsProvider =
    FutureProvider.family<Movie, int>((ref, movieId) async {
  return Movie.fetchMovieDetails(movieId);
});
