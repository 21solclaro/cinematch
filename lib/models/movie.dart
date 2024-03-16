import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Movie {
  Movie({
    required this.id,
    required this.title,
    this.posterPath,
    this.overview,
    this.originalTitle,
    this.runtime,
    this.releaseDate,
    this.genres,
  });

  final int id;
  final String title;
  final String? posterPath;
  final String? overview;
  final String? originalTitle;
  final int? runtime;
  final String? releaseDate;
  final List<String?>? genres;

  factory Movie.fromJson(dynamic json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String?,
    );
  }

  static Future<Movie> fetchMovieDetails(int movieId) async {
    final uri = Uri.https('api.themoviedb.org', '/3/movie/$movieId', {
      'api_key': dotenv.env['TMDB_API_KEY'],
    });
    final http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return Movie(
        id: data['id'],
        title: data['title'],
        posterPath: data['poster_path'],
        overview: data['overview'],
        originalTitle: data['original_title'],
        runtime: data['runtime'],
        releaseDate: data['release_date'],
        genres: (data['genres'] as List)
            .map((genre) => genre['name'] as String?)
            .toList(),
      );
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
