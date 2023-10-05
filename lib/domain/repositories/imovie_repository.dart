import 'package:codeberry_movies_test/core/errors/failures.dart';
import 'package:codeberry_movies_test/domain/entities/entities_exports.dart';
import 'package:fpdart/fpdart.dart';

abstract class IMovieRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(String movieId);
}
