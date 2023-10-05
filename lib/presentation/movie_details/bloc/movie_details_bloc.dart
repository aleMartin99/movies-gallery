import 'package:bloc/bloc.dart';
import 'package:codeberry_movies_test/domain/entities/entities_exports.dart';
import 'package:codeberry_movies_test/domain/usecases/usecases_exports.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';
part 'movie_details_status.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetails;
  MovieDetailsBloc({required this.getMovieDetails})
      : super(const MovieDetailsState()) {
    on<OnLoadMovieDetailsEvent>((event, emit) async {
      emit(state.copyWith(status: MovieDetailsStatus.loading));
      //Thanks to dependency injection I can only call the usecase instance
      final responseGetMovieDetails =
          await getMovieDetails(GetMovieDetailsParams(movieId: event.movieId));
      if (responseGetMovieDetails.isRight()) {
        final movieDetails =
            (responseGetMovieDetails as Right).value as MovieDetails?;

        if (!isClosed) {
          emit(state.copyWith(
            status: MovieDetailsStatus.success,
            details: movieDetails,
          ));
        }
      } else {
        final failure = (responseGetMovieDetails as Left).value;
        if (!isClosed) {
          emit(state.copyWith(
              failure: failure.message, status: MovieDetailsStatus.failure));
        }
      }
    });
  }
}
