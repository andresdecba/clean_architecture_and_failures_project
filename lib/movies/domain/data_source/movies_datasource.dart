import 'package:tmdb_challenge/movies/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({required int page});
}
