import 'package:cinematch/const/genres.dart';
import 'package:cinematch/providers/selection_criteria_provider.dart';
import 'package:cinematch/screens/runtime_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenreSelectionScreen extends ConsumerWidget {
  const GenreSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGenres = ref.watch(selectionCriteriaProvider).genres;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Genre'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: genreNames.length,
        itemBuilder: (context, index) {
          final genre = genreNames[index];
          final isSelected = selectedGenres.contains(genre['genre_id']);
          return InkWell(
            onTap: () {
              isSelected
                  ? ref
                      .read(selectionCriteriaProvider.notifier)
                      .removeGenre(genre['genre_id'])
                  : ref
                      .read(selectionCriteriaProvider.notifier)
                      .addGenre(genre['genre_id']);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: isSelected
                    ? const BorderSide(color: Colors.blue, width: 2.0)
                    : BorderSide.none,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(genre['icon'], size: 24, color: Colors.blueGrey[800]),
                  const SizedBox(height: 8),
                  Text(
                    genre['genre_name'],
                    style: TextStyle(
                      fontSize: 12,
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
                      builder: (context) => const RuntimeSelectionScreen(),
                    ),
                  )
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
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
