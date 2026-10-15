import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';

import 'package:cinebox/domain/movie.dart';

import './tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({required TmdbService tmdbService}) : _tmdbService = tmdbService;

  @override
  Future<Result<List<Movie>>> getPopularMovies({required String language, required int page}) async {
    final moviesData = await _tmdbService.getPopularMovies(
      language: language,
      page: page,
    );
  }
}
