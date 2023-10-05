import 'dart:async';
import 'package:codeberry_movies_test/data/datasources/imovie_datasource.dart';
import 'package:codeberry_movies_test/data/datasources/movie_datasource/movie_datasource.dart';
import 'package:codeberry_movies_test/data/repositories/movie_repository.dart';
import 'package:codeberry_movies_test/domain/repositories/imovie_repository.dart';
import 'package:codeberry_movies_test/domain/usecases/usecases_exports.dart';
import 'package:codeberry_movies_test/presentation/home/bloc/movie_bloc.dart';
import 'package:codeberry_movies_test/presentation/movie_details/bloc/movie_details_bloc.dart';
import 'package:get_it/get_it.dart';

//Favors Dependency inversion and single responsibility principles

FutureOr<void> initCore(GetIt sl) async {
  sl
    ..registerLazySingleton<IMovieDatasource>(
      () => MovieDatasource(),
    )
    ..registerLazySingleton<IMovieRepository>(
      () => MovieRepository(
        sl<IMovieDatasource>(),
      ),
    )
    ..registerLazySingleton<GetPopularMoviesUsecase>(
      () => GetPopularMoviesUsecase(
        getPopularMovies: sl<IMovieRepository>().getPopularMovies,
      ),
    )
    ..registerLazySingleton<GetMovieDetailsUsecase>(
        () => GetMovieDetailsUsecase(
              getMovieDetails: sl<IMovieRepository>().getMovieDetails,
            ))
    ..registerLazySingleton<MovieBloc>(
      () => MovieBloc(
        getPopularMovies: sl<GetPopularMoviesUsecase>(),
      ),
    )
    ..registerLazySingleton<MovieDetailsBloc>(
      () => MovieDetailsBloc(
        getMovieDetails: sl<GetMovieDetailsUsecase>(),
      ),
    );
}
