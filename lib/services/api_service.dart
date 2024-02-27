import 'dart:convert';
import 'package:cinematch/models/movie.dart';
import 'package:cinematch/models/selection_criteria.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchMovieList(SelectionCriteria selection) async {
  final uri = Uri.https('api.themoviedb.org', '/3/discover/movie', {
    'api_key': dotenv.env['TMDB_API_KEY'],
    'language': 'ja',
    'watch_region': 'JP',
    'with_genres': selection.genres.join(','),
    'with_runtime.lte': selection.runtime.toString(),
    'with_watch_providers': selection.providers.join(','),
  });
  final http.Response res = await http.get(uri);

  if (res.statusCode == 200) {
    final Map<String, dynamic> decodedBody = jsonDecode(res.body);
    final List<dynamic> results = decodedBody['results'];
    return results.map((dynamic json) => Movie.fromJson(json)).toList();
  } else {
    return [];
  }
}
