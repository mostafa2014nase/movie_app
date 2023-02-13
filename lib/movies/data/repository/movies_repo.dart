import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/error_exception.dart';
import 'package:movies_app/core/error_handler/failure_handler.dart';
import 'package:movies_app/movies/data/data_source/get_all_movies_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repesitory/base_movies_repo.dart';

class MoviesRepoData extends BaseMoviesRepo {
  final BaseAllMoviesDataSource baseAllMoviesDataSource;

  MoviesRepoData(this.baseAllMoviesDataSource);

  @override
  Future<Either<FailureHandler, List<Movie>>> getAllMovies() async{
    final result = await baseAllMoviesDataSource.getAllMovies();
    try {
      return Right(result);
    } on ErrorNetWorkException catch (fail) {
      return Left(NetWorkFailure(fail.errorModelResponse.errorMsg));
    }
  }
}
