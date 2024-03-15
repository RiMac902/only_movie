import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:only_movie/core/error/failures.dart';
import 'package:only_movie/feature/movie/domain/repositories/movie_repository.dart';

import '../../../../core/use_case/use_case.dart';
import '../entities/movie_entity.dart';

class SearchMoviesUseCase implements UseCase<List<MovieEntity>, ParamSearchMovie> {
  final MovieRepository _movieRepository;

  SearchMoviesUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call({ParamSearchMovie? params}) {
      return _movieRepository.searchMovies(params!.query);
  }
}

class ParamSearchMovie extends Equatable {
  final String query;

  const ParamSearchMovie({required this.query});

  @override
  List<Object?> get props => [query];
}
