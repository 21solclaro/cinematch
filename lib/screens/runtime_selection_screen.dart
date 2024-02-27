import 'package:cinematch/providers/selection_provider.dart';
import 'package:cinematch/screens/selected_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RuntimeSelectionScreen extends ConsumerWidget {
  const RuntimeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runtime = ref.watch(selectionCriteriaProvider).runtime;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Runtime'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$runtime min'),
          Slider(
            value: runtime.toDouble(),
            min: 0,
            max: 240,
            divisions: 24,
            label: '$runtime',
            onChanged: (double value) {
              ref
                  .read(selectionCriteriaProvider.notifier)
                  .setRuntime(value.toInt());
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(
          onPressed: runtime > 0
              ? () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectedScreen()))
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
