class MovieModel {
  final String title;
  final String overview;
  final String id;
  final String releaseDate;
  final String poster;
  final double voteAverage;
  final String originalLanguage;
  final int voteCount;
  MovieModel({
    required this.title,
    required this.overview,
    required this.id,
    required this.releaseDate,
    required this.poster,
    required this.voteCount,
    required this.voteAverage,
    required this.originalLanguage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      id: json['id'] ?? '',
      poster: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: json['vote_average'] ?? '',
      voteCount: json['vote_count'] ?? 0,
      originalLanguage: json['original_language'] ?? 0,
    );
  }
}
