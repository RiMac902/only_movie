import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/helpers/snackbar_helper.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/use_cases/get_popular_movies_usecase.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  PopularMoviesBloc(this._getPopularMoviesUseCase) : super(const PopularMoviesInitial()) {
    on<GetPopularMoviesEvent>(_onGetPopularMovies);
  }

  Future<void> _onGetPopularMovies(
      GetPopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    emit(const PopularMoviesLoading());
    try {
      final result = await _getPopularMoviesUseCase();
      emit(result.fold(
            (failure) => PopularMoviesFailure(failure.toString()),
            (movies) => PopularMoviesSuccess(movies),
      ));
    } catch (e) {
      SnackBarHelper.showError(event.context, e);
    }
  }
}
