import 'dart:convert';

import 'package:movies_app/core/app_constants.dart';
import 'package:movies_app/core/error_handler/error_exception.dart';
import 'package:movies_app/movies/data/model/movie_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseAllMoviesDataSource {
  Future<List<MovieModel>> getAllMovies();
}

class AllMoviesDataSource extends BaseAllMoviesDataSource {
  @override
  Future<List<MovieModel>> getAllMovies() async {
    http.Response response =
        await http.get(Uri.parse(AppConstants.getMoviesPath));
    if (response.statusCode == 200) {
      List movieModelList = jsonDecode(response.body)["results"];
      return List<MovieModel>.from(movieModelList.map((e) => MovieModel.fromJson(e)));
    } else {
      throw ErrorNetWorkException(
          errorModelResponse: jsonDecode(response.body));
    }
  }
}
