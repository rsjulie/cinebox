import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/domain/movie.dart';

abstract interface class TmdbRepository {
  Future<Result<List<Movie>>> getPopularMovies({
    String language,
    int page,
  });
}
