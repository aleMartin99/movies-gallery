import 'package:codeberry_movies_test/presentation/home/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsBody extends StatefulWidget {
  const MovieDetailsBody({required this.movieId, super.key});

  final int movieId;

  @override
  State<MovieDetailsBody> createState() => _MovieDetailsBodyState();
}

class _MovieDetailsBodyState extends State<MovieDetailsBody> {
  @override
  void initState() {
    context.read<MovieBloc>().getPopularMovies;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(), child: Text(''));
  }
}
