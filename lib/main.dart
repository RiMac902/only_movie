import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/routes/routes.dart';
import 'feature/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'feature/movie/presentation/bloc/latest_movies/latest_movies_bloc.dart';
import 'feature/movie/presentation/bloc/pupular_movies/popular_movies_bloc.dart';
import 'feature/movie/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'feature/movie/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnlyMovie',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => sl(),
          ),
          BlocProvider<PopularMoviesBloc>(
            create: (context) => sl(),
          ),
          BlocProvider<SearchMoviesBloc>(
            create: (context) => sl(),
          ),
          BlocProvider<TrendingMoviesBloc>(
            create: (context) => sl(),
          ),
          BlocProvider<LatestMoviesBloc>(
            create: (context) => sl(),
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: CupertinoColors.activeBlue),
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
