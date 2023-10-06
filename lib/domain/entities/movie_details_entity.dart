class MovieDetails {
  final String title;
  final String overview;
  final int id;
  final String releaseDate;
  final String poster;
  final String backdrop;
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

  MovieDetails({
    required this.title,
    required this.overview,
    required this.id,
    required this.releaseDate,
    required this.poster,
    required this.voteCount,
    required this.voteAverage,
    required this.originalLanguage,
    required this.budget,
    required this.backdrop,
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
}
