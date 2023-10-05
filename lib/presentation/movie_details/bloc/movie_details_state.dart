part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.status = MovieDetailsStatus.initial,
    this.details,
    this.failure,
  });
  final MovieDetails? details;
  final MovieDetailsStatus status;
  final String? failure;

  @override
  List<Object?> get props => [status, failure, details];
  MovieDetailsState copyWith({
    MovieDetailsStatus? status,
    MovieDetails? details,
    String? failure,
  }) {
    return MovieDetailsState(
        status: status ?? this.status,
        failure: failure ?? this.failure,
        details: details ?? this.details);
  }
}
