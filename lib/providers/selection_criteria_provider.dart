import 'package:cinematch/models/selection_criteria.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionCriteriaNotifier extends StateNotifier<SelectionCriteria> {
  SelectionCriteriaNotifier()
      : super(SelectionCriteria(genres: [], providers: [], runtime: 0));

  void addGenre(int genreId) {
    state = state.addGenre(genreId);
  }

  void removeGenre(int genreId) {
    state = state.removeGenre(genreId);
  }

  void addProvider(int providerId) {
    state = state.addProvider(providerId);
  }

  void removeProvder(int providerId) {
    state = state.removeProvider(providerId);
  }

  void setRuntime(int runtime) {
    state = state.setRuntime(runtime);
  }
}

final selectionCriteriaProvider =
    StateNotifierProvider<SelectionCriteriaNotifier, SelectionCriteria>((ref) {
  return SelectionCriteriaNotifier();
});
