import 'package:cinematch/providers/selection_provider.dart';
import 'package:cinematch/screens/home_screen.dart';
import 'package:cinematch/services/api_service.dart';
import 'package:cinematch/widgets/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieListScreen extends ConsumerWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(selectionCriteriaProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Movie List'),
        ),
        body: FutureBuilder(
          future: fetchMovieList(selection),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              if (!snapshot.hasData) {
                return const Text("404 : NOT FOUND");
              }
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: snapshot.data!
                    .map((movie) => MovieWidget(movie: movie))
                    .toList(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ElevatedButton(
            onPressed: () {
              ref.invalidate(selectionCriteriaProvider);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Restart'),
          ),
        ),
      ),
    );
  }
}
