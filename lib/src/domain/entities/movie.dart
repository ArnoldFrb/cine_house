class Movie {
  int page;
  List<Result> results;
  int totalResults;
  int totalPages;

  Movie({required this.page, required this.results, required this.totalResults, required this.totalPages});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
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

class Result {
    String? posterPaht;
    bool? adult;
    String? overview;
    String? releaseDate;
    List<int>? genreIds;
    int? id;
    String? originalTitle;
    String? originalLanguage;
    String? title;
    String? backdropPath;
    double? popularity;
    int? voteCount;
    bool? video;
    double? voteAverage;

    Result({
        this.posterPaht,
        this.adult,
        this.overview,
        this.releaseDate,
        this.genreIds,
        this.id,
        this.originalTitle,
        this.originalLanguage,
        this.title,
        this.backdropPath,
        this.popularity,
        this.voteCount,
        this.video,
        this.voteAverage,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        posterPaht: json["poster_paht"],
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
        voteAverage: json["vote_average"],
    );

    Map<String, dynamic> toJson() => {
        "poster_paht": posterPaht,
        "adult": adult,
        "overview": overview,
        "release_date": releaseDate,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
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
