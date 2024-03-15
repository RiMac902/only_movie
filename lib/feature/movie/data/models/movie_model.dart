import 'package:only_movie/feature/movie/domain/entities/movie_entity.dart';

class Movie extends MovieEntity {
  const Movie({
    required super.id,
    required super.title,
    required super.overview,
    required super.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['posterPath'] ?? '',
    );
  }

  Movie copyWith(int? id, String? title, String? overview, String? posterPath) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
    );
  }
}
