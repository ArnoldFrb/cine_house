// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:cine_house/src/domain/entities/movie.dart';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(jsonDecode(str));
String movieModelToJson(MovieModel data) => jsonEncode(data.toJson());

class MovieModel extends Movie {
  final int page;
  final List<ResultModel> results;
  final int totalResults;
  final int totalPages;

  const MovieModel({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  }) : super(
          page: page,
          results: results,
          totalResults: totalResults,
          totalPages: totalPages,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        page: json["page"],
        results: List<ResultModel>.from(
            json["results"].map((x) => ResultModel.fromJson(x))),
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_results": totalResults,
        "total_pages": totalPages,
      };
}

class ResultModel extends Result {
  final String posterPath;
  final bool adult;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  const ResultModel({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  }) : super(
          posterPath: posterPath,
          adult: adult,
          overview: overview,
          releaseDate: releaseDate,
          genreIds: genreIds,
          id: id,
          originalTitle: originalTitle,
          originalLanguage: originalLanguage,
          title: title,
          backdropPath: backdropPath,
          popularity: popularity,
          voteCount: voteCount,
          video: video,
          voteAverage: voteAverage,
        );

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        posterPath: json["poster_path"],
        adult: json["adult"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalTitle: json["original_title"],
        originalLanguage: json["original_language"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "poster_path": posterPath,
        "adult": adult,
        "overview": overview,
        "release_date": releaseDate,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "original_language": originalLanguage,
        "title": title,
        "backdrop_path": backdropPath,
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "vote_average": voteAverage,
      };
}
