part of 'popular_movies_bloc.dart';

abstract class PopularMoviesEvent extends Equatable {
  const PopularMoviesEvent();

  @override
  List<Object?> get props => [];
}

class GetPopularMoviesEvent extends PopularMoviesEvent {
  final BuildContext context;

  const GetPopularMoviesEvent({required this.context});
}
