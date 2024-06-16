import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:only_movie/feature/movie/domain/use_cases/search_movies_usecase.dart';

import '../../../../../core/utils/helpers/snackbar_helper.dart';
import '../../../domain/entities/movie_entity.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMoviesUseCase _searchMoviesUseCase;

  SearchMoviesBloc(this._searchMoviesUseCase) : super(const SearchMoviesInitial()) {
    on<GetSearchMoviesEvent>(_onSearchMovies);
  }

  Future<void> _onSearchMovies(GetSearchMoviesEvent event, Emitter<SearchMoviesState> emit) async {
    emit(const SearchMoviesLoading());
    try {
      final result = await _searchMoviesUseCase();
      emit(result.fold(
            (failure) => SearchMoviesFailure(failure.toString()),
            (movies) => SearchMoviesSuccess(movies),
      ));
    } catch (e) {
      if (event.context.mounted) {
        SnackBarHelper.showError(event.context, e);
      }
    }
  }
}
