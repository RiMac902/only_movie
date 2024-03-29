import 'package:fpdart/src/either.dart';
import 'package:only_movie/core/error/failures.dart';
import 'package:only_movie/core/use_case/use_case.dart';

import '../entities/movie_entity.dart';
import '../repositories/movie_repository.dart';

class GetLatestMoviesUseCase implements UseCase<List<MovieEntity>, void> {
  final MovieRepository _movieRepository;

  GetLatestMoviesUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call({void params}) {
    return _movieRepository.getLatestMovies();
  }
}