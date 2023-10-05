import 'package:codeberry_movies_test/core/errors/failures.dart';
import 'package:codeberry_movies_test/core/utils/utils_exports.dart';
import 'package:codeberry_movies_test/domain/entities/entities_exports.dart';
import 'package:codeberry_movies_test/domain/usecases/usecases_exports.dart';
import 'package:fpdart/fpdart.dart';

class GetMovieDetailsUsecase
    extends UseCase<MovieDetails, GetMovieDetailsParams> {
  GetMovieDetailsUsecase({required this.getMovieDetails});

  final Future<Either<Failure, MovieDetails>> Function(String movieId)
      getMovieDetails;

  @override
  Future<Either<Failure, MovieDetails>> call(GetMovieDetailsParams params) =>
      getMovieDetails(params.movieId);
}
