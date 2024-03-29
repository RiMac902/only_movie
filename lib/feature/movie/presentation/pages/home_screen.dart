import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_movie/feature/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:only_movie/feature/movie/domain/entities/movie_entity.dart';
import 'package:only_movie/feature/movie/presentation/widgets/movie_card.dart';

import '../bloc/latest_movies/latest_movies_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedMovieIndex = 0;
  late MovieEntity movie;
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LatestMoviesBloc>(context)
        .add(GetLatestMoviesEvent(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: BlocBuilder<LatestMoviesBloc, LatestMoviesState>(
        builder: (context, state) {
          if (state is LatestMoviesSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/original/${state.movies[selectedMovieIndex].backdropPath}',
                    height: 500,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black.withOpacity(0),
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Colors.black.withOpacity(1),
                            Colors.black.withOpacity(1),
                            Colors.black.withOpacity(1),
                            Colors.black.withOpacity(1),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                          ])),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider.builder(
                      itemCount: state.movies.length,
                      itemBuilder:
                          (BuildContext context, int index, int pageViewIndex) {
                        final movie = state.movies[index];
                        return MovieCard(
                            id: movie.id,
                            title: movie.title,
                            overview: movie.overview,
                            posterPath: movie.posterPath,
                            genres: movie.genres,
                            backdropPath: movie.backdropPath);
                      },
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        viewportFraction: 0.735,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.4,
                        onPageChanged: (index, reason) {
                          setState(() {
                            selectedMovieIndex = index;
                            movie = state.movies[selectedMovieIndex];
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is LatestMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LatestMoviesFailure) {
            return const Center(
              child: ColoredBox(
                color: Colors.red,
                child: Text('Failure'),
              ),
            );
          }

          return const Center(
            child: ColoredBox(
              color: Colors.yellow,
              child: Text('Nothing'),
            ),
          );
        },
      ),
    );
  }
}
