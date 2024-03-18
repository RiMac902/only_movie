import 'package:fpdart/fpdart.dart';
import 'package:only_movie/feature/movie/domain/entities/movie_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/movie_repository.dart';
import '../data_sources/movie_remote_data_source.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl(this.movieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      // TODO: implement getTrendingMovies
      throw UnimplementedError();
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
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
