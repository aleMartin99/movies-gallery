part of 'movie_bloc.dart';

class MovieState extends Equatable {
  const MovieState({
    this.status = MovieStatus.initial,
    this.moviesList = const [],
    this.failure,
  });
  final List<Movie> moviesList;
  final MovieStatus status;

  final String? failure;

  @override
  List<Object?> get props => [status, failure, moviesList];
  MovieState copyWith({
    MovieStatus? status,
    List<Movie>? moviesList,
    String? failure,
  }) {
    return MovieState(
        status: status ?? this.status,
        failure: failure ?? this.failure,
        moviesList: moviesList ?? this.moviesList);
  }
}
