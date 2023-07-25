import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb_challenge/movies/presentation/providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: _HomeView()),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingWatch = ref.watch(nowPlayingProvider);
    final nowPlayinRead = ref.read(nowPlayingProvider.notifier);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              nowPlayinRead.loadNextPage();
            },
            child: const Text('Next'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: nowPlayingWatch.length,
            itemBuilder: (context, index) {
              final movie = nowPlayingWatch[index];
              return ListTile(
                title: Text(movie.title),
              );
            },
          ),
        ],
      ),
    );
  }
}
