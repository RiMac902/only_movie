part of 'trending_movies_bloc.dart';

abstract class TrendingMoviesState extends Equatable {
  const TrendingMoviesState();

  @override
  List<Object?> get props => [];
}

class TrendingMoviesInitial extends TrendingMoviesState {
 const TrendingMoviesInitial();
}

class TrendingMoviesLoading extends TrendingMoviesState {
  const TrendingMoviesLoading();
}

class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<MovieEntity> movies;

  const TrendingMoviesSuccess(this.movies);
}

class TrendingMoviesFailure extends TrendingMoviesState {
  final String message;

  const TrendingMoviesFailure(this.message);
}