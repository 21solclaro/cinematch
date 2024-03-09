import 'package:cinematch/providers/subscription_service_provider.dart';
import 'package:cinematch/providers/selection_criteria_provider.dart';
import 'package:cinematch/screens/genre_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubscriptionServiceSelectionScreen extends ConsumerWidget {
  const SubscriptionServiceSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedProviders = ref.watch(selectionCriteriaProvider).providers;
    final providerList = ref.watch(providerListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: providerList.when(
          data: (providers) => ListView.builder(
            itemCount: providers.length,
            itemBuilder: (context, index) {
              final isSelected =
                  selectedProviders.contains(providers[index].providerId);
              return InkWell(
                onTap: () {
                  isSelected
                      ? ref
                          .read(selectionCriteriaProvider.notifier)
                          .removeProvder(providers[index].providerId)
                      : ref
                          .read(selectionCriteriaProvider.notifier)
                          .addProvider(providers[index].providerId);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: isSelected
                        ? const BorderSide(color: Colors.blue, width: 2.0)
                        : BorderSide.none,
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w200/${providers[index].logoPath}}',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    title: Text(providers[index].providerName),
                  ),
                ),
              );
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
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
