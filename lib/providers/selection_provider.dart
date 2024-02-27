import 'package:cinematch/models/selection_criteria.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectionCriteriaNotifier extends StateNotifier<SelectionCriteria> {
  SelectionCriteriaNotifier()
      : super(SelectionCriteria(genres: [], runtime: 0));

  void addGenre(int genre) {
    state = state.addGenre(genre);
  }

  void removeGenre(int genre) {
    state = state.removeGenre(genre);
  }

  void setRuntime(int runtime) {
    state = state.setRuntime(runtime);
  }
}

final selectionCriteriaProvider =
    StateNotifierProvider<SelectionCriteriaNotifier, SelectionCriteria>((ref) {
  return SelectionCriteriaNotifier();
});
