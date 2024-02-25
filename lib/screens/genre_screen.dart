import 'package:cinematch/providers/selection_provider.dart';
import 'package:cinematch/screens/runtime_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGenres = ref.watch(genreSelectionProvider);
    final List<Map<String, dynamic>> genres = [
      {'name': 'Action', 'icon': Icons.flash_on, 'id': 28},
      {'name': 'Adventure', 'icon': Icons.explore, 'id': 12},
      {'name': 'Animation', 'icon': Icons.animation, 'id': 16},
      {'name': 'Comedy', 'icon': Icons.sentiment_very_satisfied, 'id': 35},
      {'name': 'Crime', 'icon': Icons.gavel, 'id': 80},
      {'name': 'Documentary', 'icon': Icons.assignment, 'id': 99},
      {'name': 'Drama', 'icon': Icons.filter_drama, 'id': 18},
      {'name': 'Family', 'icon': Icons.family_restroom, 'id': 10751},
      {'name': 'Fantasy', 'icon': Icons.auto_awesome, 'id': 14},
      {'name': 'History', 'icon': Icons.history_edu, 'id': 36},
      {'name': 'Horror', 'icon': Icons.home, 'id': 27},
      {'name': 'Music', 'icon': Icons.music_note, 'id': 10402},
      {'name': 'Mystery', 'icon': Icons.help_outline, 'id': 9648},
      {'name': 'Romance', 'icon': Icons.favorite, 'id': 10749},
      {'name': 'Science Fiction', 'icon': Icons.science, 'id': 878},
      {'name': 'TV Movie', 'icon': Icons.live_tv, 'id': 10770},
      {'name': 'Thriller', 'icon': Icons.thunderstorm, 'id': 53},
      {'name': 'War', 'icon': Icons.military_tech, 'id': 10752},
      {'name': 'Western', 'icon': Icons.landscape, 'id': 37},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Genre'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          final isSelected = selectedGenres.contains(genre['id']);
          return InkWell(
            onTap: () {
              isSelected
                  ? ref
                      .read(genreSelectionProvider.notifier)
                      .removeGenre(genre['id'])
                  : ref
                      .read(genreSelectionProvider.notifier)
                      .addGenre(genre['id']);
            },
            child: Card(
              color: isSelected ? Colors.blue : Colors.blueGrey[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(genre['icon'], size: 40, color: Colors.blueGrey[800]),
                  const SizedBox(height: 8),
                  Text(
                    genre['name'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(
          onPressed: selectedGenres.isNotEmpty
              ? () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RuntimeSelectionScreen()))
              : null,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Next'),
        ),
      ),
    );
  }
}