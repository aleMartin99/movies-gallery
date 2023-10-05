class MovieDetailsModel {
  final String title;
  final String overview;
  final int id;
  final String releaseDate;
  final String poster;
  final double voteAverage;
  final String originalLanguage;
  final String homepage;
  final String tagline;
  final String status;
  final int voteCount;
  final List<String> genres;
  final List<String> productionCompanies;
  final List<String> productionCountries;
  final List<String> spokenLanguages;
  final int budget;
  final int revenue;
  final int runtime;

  MovieDetailsModel({
    required this.title,
    required this.overview,
    required this.id,
    required this.releaseDate,
    required this.poster,
    required this.voteCount,
    required this.voteAverage,
    required this.originalLanguage,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.productionCompanies,
    required this.productionCountries,
    required this.spokenLanguages,
    required this.revenue,
    required this.runtime,
    required this.tagline,
    required this.status,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      id: json['id'] ?? '',
      poster: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: double.tryParse(json['vote_average'].toString()) ?? 0,
      voteCount: json['vote_count'] ?? 0,
      originalLanguage: json['original_language'] ?? 0,
      budget: json['budget'] ?? 0,
      genres: json['genres']['name'] ?? '',
      productionCompanies: json['production_companies']['name'] ?? '',
      productionCountries: json['production_countries']['name'] ?? '',
      spokenLanguages: json['spoken_languages']['english_name'] ?? '',
      revenue: json['revenue'] ?? 0,
      homepage: json['homepage'] ?? '',
      tagline: json['tagline'] ?? '',
      status: json['status'] ?? '',
      runtime: json['runtime'] ?? 0,
    );
  }
}
