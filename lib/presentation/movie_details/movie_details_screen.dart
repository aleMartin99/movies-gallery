import 'package:codeberry_movies_test/presentation/movie_details/widgets/movie_details_body.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    required this.movieId,
    super.key,
  });

  final int movieId;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsBody(movieId: widget.movieId),
    );
  }
}
