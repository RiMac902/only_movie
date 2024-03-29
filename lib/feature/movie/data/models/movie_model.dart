import 'package:only_movie/feature/movie/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.overview,
      required super.posterPath,
      super.genres,
      required super.backdropPath});

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] ?? '',
      genres: List<String>.from(
          map['genre_ids'].map((genreId) => _genreMap[genreId])),
      backdropPath: map['backdrop_path'] ?? '',
    );
  }

  MovieModel copyWith(int? id, String? title, String? overview,
      String? posterPath, List<String>? genres, String? backdropPath) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      genres: genres ?? this.genres,
      backdropPath: backdropPath ?? this.backdropPath,
    );
  }

  static final Map<int, String> _genreMap = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western"
  };
}
