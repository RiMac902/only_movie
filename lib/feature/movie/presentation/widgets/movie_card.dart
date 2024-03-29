import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final List<String>? genres;

  const MovieCard({
    super.key,
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    this.genres,
    required this.backdropPath,
  });

  @override
  Widget build(BuildContext context) {
    // String genresString = genres?.join(', ') ?? '';

    return InkWell(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/original/$posterPath',
              height: 400,
              width: 270,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
