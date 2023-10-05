part of 'movie_details_bloc.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();
  
  @override
  List<Object> get props => [];
}

final class MovieDetailsInitial extends MovieDetailsState {}
