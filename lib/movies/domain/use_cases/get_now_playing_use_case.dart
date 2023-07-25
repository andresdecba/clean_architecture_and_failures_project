import 'package:dartz/dartz.dart';
import 'package:tmdb_challenge/core/network/failures.dart';
import 'package:tmdb_challenge/movies/domain/entities/movie.dart';
import 'package:tmdb_challenge/movies/domain/repositories/movies_repositoriy.dart';

// class GetDailyEarnings extends UseCase<DailyEarning, Params> {
//   final EarningsRepository repository;

//   GetDailyEarnings({required this.repository});

//   @override
//   Future<Either<Failure, DailyEarning>> call(Params params) async {
//     return await repository.getDailyEarnings(params.date);
//   }
// }

// class Params extends Equatable {
//   final String date;

//   const Params({required this.date});

//   @override
//   List<Object?> get props => [date];
// }

class GetNowPlayingUseCase {
  const GetNowPlayingUseCase(
    this.repository,
  );

  final MoviesRepository repository;

  Future<Either<Failure, List<Movie>>> call({required int page}) {
    return repository.getNowPlaying(page: page);
  }
}
