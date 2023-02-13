import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/failure_handler.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repesitory/base_movies_repo.dart';

class GetAllMoviesUseCase {
  final BaseMoviesRepo baseMoviesRepo;

  GetAllMoviesUseCase(this.baseMoviesRepo);

  Future<Either<FailureHandler, List<Movie>>> execute() async {
    return await baseMoviesRepo.getAllMovies();
  }
}
