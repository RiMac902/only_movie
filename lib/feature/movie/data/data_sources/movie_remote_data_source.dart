import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../config/tmdb/tmdp_api.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/movie_entity.dart';

abstract interface class MovieRemoteDataSource {
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies();

  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query);

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;
  final TmdbApi tmdbApi;

  MovieRemoteDataSourceImpl(this.dio, this.tmdbApi);

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies() {
    // TODO: implement getTrendingMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }

}