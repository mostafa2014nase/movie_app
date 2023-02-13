import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/get_all_movies_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repo.dart';
import 'package:movies_app/movies/domain/repesitory/base_movies_repo.dart';
import 'package:movies_app/movies/domain/use_case/get_all_movies.dart';
import 'package:movies_app/movies/presentaion/controller/riverpod.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  init() {
    getIt.registerFactory(() => GetAllMovies(getIt()));

    getIt.registerLazySingleton<GetAllMoviesUseCase>(
        () => GetAllMoviesUseCase(getIt()));
    getIt.registerLazySingleton<BaseMoviesRepo>(() => MoviesRepoData(getIt()));
    getIt.registerLazySingleton<BaseAllMoviesDataSource>(
        () => AllMoviesDataSource());
  }
}
