part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {
  const PopularMoviesInitial();
}

class PopularMoviesLoading extends PopularMoviesState {
  const PopularMoviesLoading();
}

class PopularMoviesSuccess extends PopularMoviesState {
  final List<MovieEntity> movies;

  const PopularMoviesSuccess(this.movies);
}

class PopularMoviesFailure extends PopularMoviesState {
  final String message;

  const PopularMoviesFailure(this.message);
}
