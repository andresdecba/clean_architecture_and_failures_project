import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_challenge/movies/data/data_source/themoviedb_datasource.dart';
import 'package:tmdb_challenge/movies/data/repositories/movies_repository_impl.dart';
import 'package:tmdb_challenge/movies/domain/entities/movie.dart';
import 'package:tmdb_challenge/movies/domain/use_cases/get_now_playing_use_case.dart';

final nowPlayingProvider = StateNotifierProvider<NowPlayingController, List<Movie>>((ref) {
  final useCase = GetNowPlayingUseCase(
    MovieRepositoryImpl(
      MoviedbDatasource(),
    ),
  );

  return NowPlayingController(useCase: useCase);
});

// controller de nowPlayingProvider
class NowPlayingController extends StateNotifier<List<Movie>> {
  NowPlayingController({
    required this.useCase,
  }) : super([]);

  GetNowPlayingUseCase useCase;
  int currentPage = 1;

  Future<void> loadNextPage() async {
    currentPage++;
    final result = await useCase.call(page: currentPage);
    final List<Movie> movies = [];

    result.fold(
      (failure) {
        failure.showError();
      },
      (data) {
        movies.addAll(data);
      },
    );
    state = [...movies];
  }
}
