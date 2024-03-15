import 'package:fpdart/fpdart.dart';
import 'package:only_movie/core/error/failures.dart';
import 'package:only_movie/feature/movie/domain/entities/movie_entity.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies();

  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query);

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
}