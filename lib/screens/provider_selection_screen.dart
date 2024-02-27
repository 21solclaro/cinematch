import 'package:cinematch/const/providers.dart';
import 'package:cinematch/providers/selection_provider.dart';
import 'package:cinematch/screens/genre_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderSelectionScreen extends ConsumerWidget {
  const ProviderSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProviders = ref.watch(selectionCriteriaProvider).providers;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Provider'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(32),
        itemCount: providerNames.length,
        itemBuilder: (context, index) {
          final provider = providerNames[index];
          final isSelected =
              selectedProviders.contains(provider['provider_id']);
          return InkWell(
            onTap: () {
              isSelected
                  ? ref
                      .read(selectionCriteriaProvider.notifier)
                      .removeProvder(provider['provider_id'])
                  : ref
                      .read(selectionCriteriaProvider.notifier)
                      .addProvider(provider['provider_id']);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Card(
                color: isSelected ? Colors.blue : Colors.blueGrey[100],
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      provider['provider_name'],
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(
          onPressed: selectedProviders.isNotEmpty
              ? () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GenreSelectionScreen()))
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
