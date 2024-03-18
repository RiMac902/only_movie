import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_movie/feature/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:only_movie/feature/movie/presentation/widgets/movie_card.dart';

import '../bloc/pupular_movies/popular_movies_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PopularMoviesBloc>(context).add(GetPopularMoviesEvent(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(
                SignOutAuthEvent(context: context),
              );
            },
            child: const Text('Log out'),
          ),
        ],
      ),
      body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (context, state) {
          if (state is PopularMoviesSuccess) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = state.movies[index];
                print(movie.posterPath);
                return MovieCard(
                  id: movie.id,
                  title: movie.title,
                  overview: movie.overview,
                  posterPath: movie.posterPath,
                );
              },
            );
          }

          if (state is PopularMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PopularMoviesFailure) {
            return const Center(
              child: Text('Failure'),
            );
          }

          return const Center(
            child: ColoredBox(
              color: Colors.red,
              child: Text('Nothing'),
            ),
          );
        },
      ),
    );
  }
}
