import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SmoothTransitionImage extends StatefulWidget {
  final String imageUrl;

  const SmoothTransitionImage({super.key, required this.imageUrl});

  @override
  _SmoothTransitionImageState createState() => _SmoothTransitionImageState();
}

class _SmoothTransitionImageState extends State<SmoothTransitionImage> {
  late String _currentImageUrl = widget.imageUrl;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: CachedNetworkImage(
        key: ValueKey<String>(_currentImageUrl),
        imageUrl: _currentImageUrl,
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
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  @override
  void didUpdateWidget(SmoothTransitionImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageUrl != widget.imageUrl) {
      setState(() {
        _currentImageUrl = widget.imageUrl;
      });
    }
  }
}
