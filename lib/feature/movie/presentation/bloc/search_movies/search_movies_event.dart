part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object?> get props => [];
}

class GetSearchMoviesEvent extends SearchMoviesEvent {
  final BuildContext context;
  final String query;

  const GetSearchMoviesEvent({required this.context, required this.query});
}
