import 'package:cinematch/const/genre.dart';
import 'package:cinematch/providers/selection_provider.dart';
import 'package:cinematch/screens/runtime_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({super.key});

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
                      .read(selectionCriteriaProvider.notifier)
                      .removeGenre(genre['id'])
                  : ref
                      .read(selectionCriteriaProvider.notifier)
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
