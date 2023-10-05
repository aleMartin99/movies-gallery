import 'package:codeberry_movies_test/core/errors/failures.dart';
import 'package:codeberry_movies_test/data/models/models_exports.dart';
import 'package:fpdart/fpdart.dart';

abstract class IMovieDatasource {
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(String movieId);
}
