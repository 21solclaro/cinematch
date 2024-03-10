import 'package:cinematch/providers/selection_criteria_provider.dart';
import 'package:cinematch/screens/home_screen.dart';
import 'package:cinematch/services/api_service.dart';
import 'package:cinematch/widgets/movie_card.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder(
            future: fetchMovieList(selection),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text("Failed: No entry, please retry."));
                }
                return GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  children: snapshot.data!
                      .map((movie) => MovieCard(movie: movie))
                      .toList(),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
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
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
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
