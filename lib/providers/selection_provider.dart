import 'package:flutter_riverpod/flutter_riverpod.dart';

// Genre
class GenreSelectionNotifier extends StateNotifier<List<int>> {
  GenreSelectionNotifier() : super([]);

  void addGenre(int genreId) {
    if (!state.contains(genreId)) {
      state = [...state, genreId];
    }
  }

  void removeGenre(int genreId) {
    state = state.where((id) => id != genreId).toList();
  }

  bool isSelected(int genreId) => state.contains(genreId);
}

// Runtime
class RuntimeSelectionNotifier extends StateNotifier<int> {
  RuntimeSelectionNotifier() : super(0);

  void setRuntime(int runtime) {
    state = runtime;
  }
}

final genreSelectionProvider =
    StateNotifierProvider<GenreSelectionNotifier, List<int>>((ref) {
  return GenreSelectionNotifier();
});

final runtimeSelectionProvider =
    StateNotifierProvider<RuntimeSelectionNotifier, int>((ref) {
  return RuntimeSelectionNotifier();
});
