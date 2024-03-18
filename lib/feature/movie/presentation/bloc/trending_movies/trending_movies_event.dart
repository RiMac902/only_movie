part of 'trending_movies_bloc.dart';

abstract class TrendingMoviesEvent extends Equatable {
  const TrendingMoviesEvent();

  @override
  List<Object?> get props => [];
}

class GetTrendingMoviesEvent extends TrendingMoviesEvent {
  final BuildContext context;

  const GetTrendingMoviesEvent({required this.context});
}