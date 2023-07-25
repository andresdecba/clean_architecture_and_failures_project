import 'package:dartz/dartz.dart';
import 'package:tmdb_challenge/core/network/api_network.dart';
import 'package:tmdb_challenge/core/network/failures.dart';
import 'package:tmdb_challenge/movies/domain/data_source/movies_datasource.dart';
import 'package:tmdb_challenge/movies/domain/entities/movie.dart';
import 'package:tmdb_challenge/movies/domain/repositories/movies_repositoriy.dart';

class MovieRepositoryImpl extends MoviesRepository {
  MovieRepositoryImpl(
    this.datasource,
  );

  final MoviesDatasource datasource;

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying({required int page}) {
    return ApiNetwork.call(() async => datasource.getNowPlaying(page: page));
  }
}
