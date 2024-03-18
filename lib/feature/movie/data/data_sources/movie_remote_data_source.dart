import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../config/tmdb/tmdp_api.dart';
import '../../../../core/error/failures.dart';
import '../models/movie_model.dart';

abstract interface class MovieRemoteDataSource {
  Future<Either<Failure, List<MovieModel>>> getTrendingMovies();

  Future<Either<Failure, List<MovieModel>>> searchMovies(String query);

  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    try {
      final response = await dio.get('${TmdbApi.baseUrl}/movie/popular',
          queryParameters: {'api_key': TmdbApi.apiKey});

      if (response.statusCode == 200) {
        final List<dynamic> movieData = response.data['results'];
        final List<MovieModel> result =
            movieData.map((data) => MovieModel.fromJson(data)).toList();
        return right(result);
      } else {
        return left(Failure(
            'Failed to fetch popular movies. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return left(Failure('An error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTrendingMovies() async {
    try {
      final response = await dio.get('${TmdbApi.baseUrl}/trending/all/day',
          queryParameters: {'api_key': TmdbApi.apiKey});

      if (response.statusCode == 200) {
        final List<dynamic> movieData = response.data['results'];
        final List<MovieModel> result =
            movieData.map((data) => MovieModel.fromJson(data)).toList();
        return right(result);
      } else {
        return left(Failure(
            'Failed to fetch popular movies. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return left(Failure('An error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> searchMovies(String query) async {
    try {
      final response =
          await dio.get('${TmdbApi.baseUrl}/search/movie', queryParameters: {
        'api_key': TmdbApi.apiKey,
        'query': query,
      });

      if (response.statusCode == 200) {
        final List<dynamic> movieData = response.data['results'];
        final List<MovieModel> result =
            movieData.map((data) => MovieModel.fromJson(data)).toList();
        return right(result);
      } else {
        return left(Failure(
            'Failed to fetch popular movies. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      return left(Failure('An error occurred: $e'));
    }
  }
}
