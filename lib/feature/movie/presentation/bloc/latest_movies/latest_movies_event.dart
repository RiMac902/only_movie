part of 'latest_movies_bloc.dart';

abstract class LatestMoviesEvent extends Equatable {
  const LatestMoviesEvent();

  @override
  List<Object?> get props => [];
}

class GetLatestMoviesEvent extends LatestMoviesEvent {
  final BuildContext context;

  const GetLatestMoviesEvent({required this.context});
}
