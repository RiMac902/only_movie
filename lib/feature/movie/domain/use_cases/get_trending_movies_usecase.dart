import 'package:fpdart/src/either.dart';
import 'package:only_movie/core/error/failures.dart';
import 'package:only_movie/core/use_case/use_case.dart';
import 'package:only_movie/feature/movie/domain/repositories/movie_repository.dart';

import '../entities/movie_entity.dart';

class GetTrendingMoviesUseCase implements UseCase<List<MovieEntity>, void> {
  final MovieRepository _movieRepository;

  GetTrendingMoviesUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call({void params}) {
    return _movieRepository.getTrendingMovies();
  }

}