part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {}

class OnLoadMovieDetailsEvent extends MovieDetailsEvent {
  OnLoadMovieDetailsEvent({required this.movieId});
  final int movieId;
  @override
  List<Object> get props => [movieId];
}
