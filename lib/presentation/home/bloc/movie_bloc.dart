import 'package:bloc/bloc.dart';
import 'package:codeberry_movies_test/core/utils/utils_exports.dart';
import 'package:codeberry_movies_test/domain/entities/entities_exports.dart';
import 'package:codeberry_movies_test/domain/usecases/usecases_exports.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

part 'movie_event.dart';
part 'movie_state.dart';
part 'movie_status.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMoviesUsecase getPopularMovies;

  MovieBloc({required this.getPopularMovies}) : super(const MovieState()) {
    on<OnLoadPopularMoviesEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));
//Thanks to dependency injection I can only call the usecase instance
      final responseGetPopularMovies = await getPopularMovies(NoParams());
      if (responseGetPopularMovies.isRight()) {
        final popularMovies =
            (responseGetPopularMovies as Right).value as List<Movie>?;

        if (!isClosed) {
          emit(state.copyWith(
            status: MovieStatus.success,
            moviesList: popularMovies,
          ));
        }
      } else {
        final failure = (responseGetPopularMovies as Left).value;
        if (!isClosed) {
          emit(state.copyWith(
              failure: failure.message, status: MovieStatus.failure));
        }
      }
    });
  }
}
