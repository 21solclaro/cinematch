class SelectionCriteria {
  SelectionCriteria({
    required this.genres,
    required this.providers,
    required this.runtime,
  });

  final List<int> genres;
  final List<int> providers;
  final int runtime;

  SelectionCriteria addGenre(int genreId) {
    if (!genres.contains(genreId)) {
      return SelectionCriteria(
        genres: [...genres, genreId],
        providers: providers,
        runtime: runtime,
      );
    }
    return this;
  }

  SelectionCriteria removeGenre(int genreId) {
    return SelectionCriteria(
      genres: genres.where((id) => id != genreId).toList(),
      providers: providers,
      runtime: runtime,
    );
  }

  SelectionCriteria addProvider(int providerId) {
    if (!genres.contains(providerId)) {
      return SelectionCriteria(
        genres: genres,
        providers: [...providers, providerId],
        runtime: runtime,
      );
    }
    return this;
  }

  SelectionCriteria removeProvider(int providerId) {
    return SelectionCriteria(
      genres: genres,
      providers: providers.where((id) => id != providerId).toList(),
      runtime: runtime,
    );
  }

  SelectionCriteria setRuntime(int newRuntime) {
    return SelectionCriteria(
      genres: genres,
      providers: providers,
      runtime: newRuntime,
    );
  }
}
