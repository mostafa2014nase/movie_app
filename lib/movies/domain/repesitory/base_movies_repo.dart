import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/failure_handler.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepo {
  Future<Either< FailureHandler, List<Movie> >>  getAllMovies();
}
