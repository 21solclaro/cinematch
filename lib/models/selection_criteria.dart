import 'package:cinematch/const/genres.dart';
import 'package:cinematch/const/providers.dart';

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

  List<dynamic> get providerNamesList {
    return providers.map((id) {
      final provider = providerNames.firstWhere(
        (element) => element['provider_id'] == id,
        orElse: () => {'provider_name': 'Unknown'},
      );
      return provider['provider_name'];
    }).toList();
  }

  List<dynamic> get genreNamesList {
    return genres.map((id) {
      final genre = genreNames.firstWhere(
        (element) => element['genre_id'] == id,
        orElse: () => {'genre_name': 'Unknown'},
      );
      return genre['genre_name'];
    }).toList();
  }
}
