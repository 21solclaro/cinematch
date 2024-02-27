class SelectionCriteria {
  SelectionCriteria({
    required this.genres,
    required this.runtime,
  });

  final List<int> genres;
  final int runtime;

  SelectionCriteria addGenre(int genreId) {
    if (!genres.contains(genreId)) {
      return SelectionCriteria(
        genres: [...genres, genreId],
        runtime: runtime,
      );
    }
    return this;
  }

  SelectionCriteria removeGenre(int genreId) {
    return SelectionCriteria(
      genres: genres.where((id) => id != genreId).toList(),
      runtime: runtime,
    );
  }

  SelectionCriteria setRuntime(int newRuntime) {
    return SelectionCriteria(genres: genres, runtime: newRuntime);
  }
}
