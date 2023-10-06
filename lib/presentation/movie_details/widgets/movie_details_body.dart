import 'package:codeberry_movies_test/presentation/movie_details/bloc/movie_details_bloc.dart';
import 'package:codeberry_movies_test/presentation/movie_details/widgets/widgets_exports.dart';
import 'package:flutter/cupertino.dart';
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
    context
        .read<MovieDetailsBloc>()
        .add(OnLoadMovieDetailsEvent(movieId: widget.movieId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context) / 100;
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        return state.status == MovieDetailsStatus.loading
            ? SizedBox(
                height: size.height * 100,
                child: const Center(child: CupertinoActivityIndicator()))
            : state.status == MovieDetailsStatus.success
                ? ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      MovieImages(movieDetails: state.details!),
                      TopRoundedContainer(
                        color: Colors.white,
                        child: Column(
                          children: [
                            MovieDescription(
                              movieDetails: state.details!,
                            ),
                            TopRoundedContainer(
                              color: const Color(0xFFF6F7F9),
                              child: SizedBox(
                                height: size.height * 10,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 15),
                                      child: Text(
                                        state.details!.homepage,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    height: size.height * 100,
                    child: Center(
                      child: Text(
                        state.failure.toString(),
                      ),
                    ),
                  );
      },
    );
  }
}
