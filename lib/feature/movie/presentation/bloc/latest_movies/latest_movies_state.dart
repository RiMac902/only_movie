part of 'latest_movies_bloc.dart';

abstract class LatestMoviesState extends Equatable {
  const LatestMoviesState();

  @override
  List<Object> get props => [];
}

class LatestMoviesInitial extends LatestMoviesState {
  const LatestMoviesInitial();
}

class LatestMoviesLoading extends LatestMoviesState {
  const LatestMoviesLoading();
}

class LatestMoviesSuccess extends LatestMoviesState {
  final List<MovieEntity> movies;

  const LatestMoviesSuccess(this.movies);
}

class LatestMoviesFailure extends LatestMoviesState {
  final String message;

  const LatestMoviesFailure(this.message);
}