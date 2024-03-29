import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final List<String>? genres;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    this.genres
  });

  @override
  List<Object?> get props => [id, title, overview, posterPath, genres, backdropPath];
}
