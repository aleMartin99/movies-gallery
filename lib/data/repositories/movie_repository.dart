import 'package:codeberry_movies_test/core/errors/failures.dart';
import 'package:codeberry_movies_test/data/datasources/imovie_datasource.dart';
import 'package:codeberry_movies_test/data/models/models_exports.dart';
import 'package:codeberry_movies_test/domain/entities/entities_exports.dart';
import 'package:codeberry_movies_test/domain/repositories/imovie_repository.dart';
import 'package:fpdart/fpdart.dart';

class MovieRepository implements IMovieRepository {
  final IMovieDatasource datasource;
  MovieRepository(this.datasource);

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    var popularMoviesResponse = await datasource.getPopularMovies();
    if (popularMoviesResponse.isRight()) {
      final movieModelList =
          ((popularMoviesResponse as Right).value as List<MovieModel>);
//convert de movieModel a movieEntity
      final List<Movie> popularMoviesList = movieModelList
          .map((movie) => Movie(
                id: movie.id,
                originalLanguage: movie.originalLanguage,
                voteCount: movie.voteCount,
                overview: movie.overview,
                poster: movie.poster,
                releaseDate: movie.releaseDate,
                title: movie.title,
                voteAverage: movie.voteAverage,
              ))
          .toList();

      return right(popularMoviesList);
    } else {
      return left((popularMoviesResponse as Left).value);
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async {
    var response = await datasource.getMovieDetails(movieId);
    if (response.isRight()) {
      final movieDetailsModel =
          ((response as Right).value as MovieDetailsModel);
      //convert from movieDetailsModel to movieDetailsEntity
      final movieDetails = MovieDetails(
          budget: movieDetailsModel.budget,
          genres: movieDetailsModel.genres,
          homepage: movieDetailsModel.homepage,
          id: movieDetailsModel.id,
          originalLanguage: movieDetailsModel.originalLanguage,
          voteCount: movieDetailsModel.voteCount,
          overview: movieDetailsModel.overview,
          poster: movieDetailsModel.poster,
          productionCompanies: movieDetailsModel.productionCompanies,
          productionCountries: movieDetailsModel.productionCountries,
          releaseDate: movieDetailsModel.releaseDate,
          revenue: movieDetailsModel.revenue,
          runtime: movieDetailsModel.runtime,
          spokenLanguages: movieDetailsModel.spokenLanguages,
          status: movieDetailsModel.status,
          tagline: movieDetailsModel.tagline,
          title: movieDetailsModel.title,
          voteAverage: movieDetailsModel.voteAverage,
          backdrop: movieDetailsModel.backdrop);
      return right(movieDetails);
    } else {
      return left((response as Left).value);
    }
  }
}
