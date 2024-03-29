import 'package:fpdart/fpdart.dart';
import 'package:only_movie/feature/movie/domain/entities/movie_entity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/movie_repository.dart';
import '../data_sources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
      return movieRemoteDataSource.getPopularMovies();
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies() async {
      return movieRemoteDataSource.getTrendingMovies();
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query) async {
      return movieRemoteDataSource.searchMovies(query);
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getLatestMovies() async {
    return movieRemoteDataSource.getLatestMovies();
  }
}
