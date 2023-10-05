part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {}

class OnLoadPopularMoviesEvent extends MovieEvent {
  OnLoadPopularMoviesEvent();

  @override
  List<Object> get props => [];
}
