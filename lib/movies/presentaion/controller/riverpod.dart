import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/error_handler/failure_handler.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/use_case/get_all_movies.dart';

final getAllMovies = ChangeNotifierProvider<GetAllMovies>((ref) => GetAllMovies(getIt()));

class GetAllMovies extends ChangeNotifier {
  final GetAllMoviesUseCase getAllMoviesUseCase;

  GetAllMovies(this.getAllMoviesUseCase) {
    loadData();
  }

  List<Movie> movies = [];
  FailureHandler fail = const FailureHandler("");

  loadData() async {
    final result = await getAllMoviesUseCase.execute();
    result.fold((l) {
      fail = l;
      notifyListeners();
    }, (r) {
      movies = r;
      notifyListeners();
    });
  }
}
