import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int page;
  final List<Result> results;
  final int totalResults;
  final int totalPages;

  const Movie({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  @override
  List<Object?> get props => [page, results, totalResults, totalPages];
}

class Result extends Equatable {
  final String? posterPaht;
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

  const Result({
    this.posterPaht,
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
  });

  @override
  List<Object?> get props => [
        posterPaht,
        adult,
        overview,
        releaseDate,
        genreIds,
        id,
        originalTitle,
        originalLanguage,
        title,
        backdropPath,
        popularity,
        voteCount,
        video,
        voteAverage,
      ];
}
