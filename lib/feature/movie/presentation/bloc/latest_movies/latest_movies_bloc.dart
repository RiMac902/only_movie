import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/helpers/snackbar_helper.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/use_cases/get_latest_movies_usecase.dart';

part 'latest_movies_event.dart';
part 'latest_movies_state.dart';

class LatestMoviesBloc extends Bloc<LatestMoviesEvent, LatestMoviesState> {
  final GetLatestMoviesUseCase _getLatestMoviesUseCase;

  LatestMoviesBloc(this._getLatestMoviesUseCase)
      : super(const LatestMoviesInitial()) {
    on<LatestMoviesEvent>(_onGetLatestMovies);
  }

  Future<void> _onGetLatestMovies(event, emit) async {
    emit(const LatestMoviesLoading());
    try {
      final result = await _getLatestMoviesUseCase();
      emit(
        result.fold(
          (failure) => LatestMoviesFailure(failure.toString()),
          (movies) => LatestMoviesSuccess(movies),
        ),
      );
    } catch (e) {
      SnackBarHelper.showError(event.context, e);
    }
  }
}
