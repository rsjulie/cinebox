// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  final int id;
  final String title;
  final String overview;
  final List<int> genreIds;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String? releaseDate;
  final bool isFavorite;
  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.genreIds,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    this.releaseDate,
    this.isFavorite = false,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    List<int>? genreIds,
    String? posterPath,
    String? backdropPath,
    double? voteAverage,
    String? releaseDate,
    bool? isFavorite,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      genreIds: genreIds ?? this.genreIds,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      voteAverage: voteAverage ?? this.voteAverage,
      releaseDate: releaseDate ?? this.releaseDate,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
