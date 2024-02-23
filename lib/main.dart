import 'package:cinematch/models/movie.dart';
import 'package:cinematch/widgets/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Movie>> _fetchMovieList() async {
    await dotenv.load(fileName: ".env");
    final uri = Uri.https('api.themoviedb.org', '/3/movie/now_playing', {
      'api_key': dotenv.env['TMDB_API_KEY'],
      'language': 'ja',
      'region': 'JP',
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Movie List'),
        ),
        body: FutureBuilder(
          future: _fetchMovieList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              if (!snapshot.hasData) {
                return const Text("データが見つかりません");
              }
              return ListView(
                children: snapshot.data!
                    .map((movie) => MovieWidget(movie: movie))
                    .toList(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
