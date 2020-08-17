// To parse this JSON data, do
//
//     final trending = trendingFromJson(jsonString);

import 'dart:convert';

Trending trendingFromJson(String str) => Trending.fromJson(json.decode(str));

String trendingToJson(Trending data) => json.encode(data.toJson());

class Trending {
  Trending({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  Result({
    this.id,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.title,
    this.releaseDate,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.posterPath,
    this.popularity,
    this.mediaType,
    this.firstAirDate,
    this.name,
    this.originCountry,
    this.originalName,
  });

  int id;
  bool video;
  int voteCount;
  double voteAverage;
  String title;
  DateTime releaseDate;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String posterPath;
  double popularity;
  MediaType mediaType;
  DateTime firstAirDate;
  String name;
  List<String> originCountry;
  String originalName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    video: json["video"] == null ? null : json["video"],
    voteCount: json["vote_count"],
    voteAverage: json["vote_average"].toDouble(),
    title: json["title"] == null ? null : json["title"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"] == null ? null : json["original_title"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    backdropPath: json["backdrop_path"],
    adult: json["adult"] == null ? null : json["adult"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    popularity: json["popularity"].toDouble(),
    mediaType: mediaTypeValues.map[json["media_type"]],
    firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
    name: json["name"] == null ? null : json["name"],
    originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
    originalName: json["original_name"] == null ? null : json["original_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "video": video == null ? null : video,
    "vote_count": voteCount,
    "vote_average": voteAverage,
    "title": title == null ? null : title,
    "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "original_language": originalLanguage,
    "original_title": originalTitle == null ? null : originalTitle,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "backdrop_path": backdropPath,
    "adult": adult == null ? null : adult,
    "overview": overview,
    "poster_path": posterPath,
    "popularity": popularity,
    "media_type": mediaTypeValues.reverse[mediaType],
    "first_air_date": firstAirDate == null ? null : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
    "name": name == null ? null : name,
    "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry.map((x) => x)),
    "original_name": originalName == null ? null : originalName,
  };
}

enum MediaType { MOVIE, TV }

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE,
  "tv": MediaType.TV
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
