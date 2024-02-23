class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  final int id;
  final String title;
  final String posterPath;

  factory Movie.fromJson(dynamic json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
    );
  }
}
