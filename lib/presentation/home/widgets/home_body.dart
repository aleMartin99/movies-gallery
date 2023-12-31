import 'package:codeberry_movies_test/presentation/home/bloc/movie_bloc.dart';
import 'package:codeberry_movies_test/presentation/home/widgets/movie_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<MovieBloc>().add(OnLoadPopularMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context) / 100;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return state.status == MovieStatus.loading
              ? SizedBox(
                  height: size.height * 100,
                  child: const Center(child: CupertinoActivityIndicator()))
              : state.status == MovieStatus.success
                  ? Column(
                      children: [
                        SizedBox(
                          height: size.height * 2,
                        ),
                        SafeArea(
                          child: Text(
                            'Popular movies',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: 21),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: GridView.count(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              clipBehavior: Clip.hardEdge,
                              physics: const BouncingScrollPhysics(),
                              childAspectRatio: 0.7,
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 1,
                              children: List.generate(
                                  state.moviesList.length,
                                  (index) => MovieCard(
                                        movie: state.moviesList[index],
                                      ))),
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
      ),
    );
  }
}
