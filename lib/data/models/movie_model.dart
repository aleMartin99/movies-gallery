class MovieModel {
  final String title;
  final String overview;
  final int id;
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
      id: json['id'] ?? 0,
      poster: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: double.tryParse(json['vote_average'].toString()) ?? 0,
      voteCount: json['vote_count'] ?? 0,
      originalLanguage: json['original_language'] ?? '',
    );
  }
}
