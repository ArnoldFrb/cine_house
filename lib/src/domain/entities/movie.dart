class Movie {
    Movie({
        required this.page,
        required this.results,
        required this.totalResults,
        required this.totalPages,
    });

    int page;
    List<Result> results;
    int totalResults;
    int totalPages;
}

class Result {
    Result({
        required this.posterPaht,
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

    String posterPaht;
    bool adult;
    String overview;
    String releaseDate;
    List<int> genreIds;
    int id;
    String originalTitle;
    String originalLanguage;
    String title;
    String backdropPath;
    double popularity;
    int voteCount;
    bool video;
    int voteAverage;
}
