import 'package:codeberry_movies_test/core/errors/failures.dart';
import 'package:codeberry_movies_test/core/utils/utils_exports.dart';
import 'package:codeberry_movies_test/domain/entities/entities_exports.dart';
import 'package:fpdart/fpdart.dart';

class GetPopularMoviesUsecase extends UseCase<List<Movie>, NoParams> {
  GetPopularMoviesUsecase({required this.getPopularMovies});

  final Future<Either<Failure, List<Movie>>> Function() getPopularMovies;

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) =>
      getPopularMovies();
}
