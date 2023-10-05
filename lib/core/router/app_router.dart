import 'package:codeberry_movies_test/presentation/home/home_screen.dart';
import 'package:codeberry_movies_test/presentation/movie_details/movie_details_screen.dart';
import 'package:flutter/material.dart';

const String homeRoute = "/home";
const String movieDetailsRoute = "/movieDetails";

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case movieDetailsRoute:
        if (args is MovieDetailsArguments) {
          return MaterialPageRoute(
              builder: (_) => MovieDetailsScreen(
                    movieId: args.movieId,
                  ));
        } else {
          return _errorRoute();
        }

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('Error'),
      ),
    );
  });
}

class MovieDetailsArguments {
  int movieId;

  MovieDetailsArguments({required this.movieId});
}
