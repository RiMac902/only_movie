import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
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
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500/${widget.posterPath}',
              height: MediaQuery.of(context).size.height * 0.4,
              width:  MediaQuery.of(context).size.width * 0.5,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
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
              widget.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }


}
