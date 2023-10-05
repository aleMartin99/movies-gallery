import 'dart:convert';
import 'package:codeberry_movies_test/core/constants/api_helpers.dart';
import 'package:codeberry_movies_test/data/datasources/imovie_datasource.dart';
import 'package:codeberry_movies_test/data/models/models_exports.dart';
import 'package:codeberry_movies_test/core/errors/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class MovieDatasource implements IMovieDatasource {
  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    try {
      final response = await http.get(
        Uri.parse(basePopularMoviesUrl),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
      );
      if (response.statusCode == 200) {
        final moviesData =
            json.decode(response.body)['results'] as List<dynamic>;

        return right(
            moviesData.map((movie) => MovieModel.fromJson(movie)).toList());
      } else if (response.statusCode == 501) {
        return left(const InvalidServiceFailure());
      } else if (response.statusCode == 401) {
        return left(const AuthenticationFailure());
      } else if (response.statusCode == 503) {
        return left(const ServiceOfflineFailure());
      } else {
        return left(const ServerFailure());
      }
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      String movieId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseMovieDetailUrl$movieId'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
      );
      if (response.statusCode == 200) {
        final movieData = json.decode(response.body) as Map<String, dynamic>;
        return right(MovieDetailsModel.fromJson(movieData));
      } else if (response.statusCode == 501) {
        return left(const InvalidServiceFailure());
      } else if (response.statusCode == 401) {
        return left(const AuthenticationFailure());
      } else if (response.statusCode == 503) {
        return left(const ServiceOfflineFailure());
      } else {
        return left(const ServerFailure());
      }
    } catch (e) {
      return left(UnexpectedFailure(message: e.toString()));
    }
  }
}
