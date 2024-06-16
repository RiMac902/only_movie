import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/helpers/snackbar_helper.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/use_cases/get_trending_movies_usecase.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMoviesUseCase _getTrendingMoviesUseCase;
  TrendingMoviesBloc(this._getTrendingMoviesUseCase) : super(const TrendingMoviesInitial()) {
    on<GetTrendingMoviesEvent>(_onGetTrendingMovies);
  }

  Future<void> _onGetTrendingMovies(
      GetTrendingMoviesEvent event, Emitter<TrendingMoviesState> emit) async {
    emit(const TrendingMoviesLoading());
    try {
      final result = await _getTrendingMoviesUseCase();
      emit(result.fold(
            (failure) => TrendingMoviesFailure(failure.toString()),
            (movies) => TrendingMoviesSuccess(movies),
      ));
    } catch (e) {
      if (event.context.mounted) {
        SnackBarHelper.showError(event.context, e);
      }
    }
  }
}
