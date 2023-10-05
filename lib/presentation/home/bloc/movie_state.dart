part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  const MovieState();
  
  @override
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}
