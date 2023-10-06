import 'package:codeberry_movies_test/core/injection_container/init_core.dart';
import 'package:codeberry_movies_test/core/router/app_router.dart';
import 'package:codeberry_movies_test/core/router/routes.dart';
import 'package:codeberry_movies_test/core/theme/theme.dart';
import 'package:codeberry_movies_test/presentation/home/bloc/movie_bloc.dart';
import 'package:codeberry_movies_test/presentation/movie_details/bloc/movie_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize all dependencies with the given GetIt service locator as sl
  await initCore(sl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MovieBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<MovieDetailsBloc>(),
        )
      ],
      child: MaterialApp(
        home: const AppRouter(),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRoutes.homeRoute,
        debugShowCheckedModeBanner: false,
        theme: theme(),
        title: 'Codeberry-Movies Test',
      ),
    );
  }
}
