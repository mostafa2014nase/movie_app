import 'dart:ffi';

import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      MovieModel(id: json["id"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        genreIds:List.from(json["genre_ids"].map((e) => e)),
        overview: json["overview"],
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"].toDouble(),);

}
