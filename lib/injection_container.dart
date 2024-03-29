import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:only_movie/feature/movie/domain/use_cases/get_latest_movies_usecase.dart';
import 'package:only_movie/feature/movie/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:only_movie/feature/movie/domain/use_cases/get_trending_movies_usecase.dart';
import 'package:only_movie/feature/movie/domain/use_cases/search_movies_usecase.dart';
import 'package:only_movie/feature/movie/presentation/bloc/pupular_movies/popular_movies_bloc.dart';

import 'feature/authentication/data/data_sources/firebase_auth_data_source.dart';
import 'feature/authentication/data/data_sources/firebase_storage_data_source.dart';
import 'feature/authentication/data/repositories/auth_repository_impl.dart';
import 'feature/authentication/domain/repositories/auth_repository.dart';
import 'feature/authentication/domain/use_cases/edit_user_usecase.dart';
import 'feature/authentication/domain/use_cases/get_current_user_usecase.dart';
import 'feature/authentication/domain/use_cases/send_recovery_email_usecase.dart';
import 'feature/authentication/domain/use_cases/signin_apple_usecase.dart';
import 'feature/authentication/domain/use_cases/signin_email_password.dart';
import 'feature/authentication/domain/use_cases/signin_facebook_usecase.dart';
import 'feature/authentication/domain/use_cases/signin_google_usecase.dart';
import 'feature/authentication/domain/use_cases/signout.dart';
import 'feature/authentication/domain/use_cases/signup_email_password.dart';
import 'feature/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'feature/movie/data/data_sources/movie_remote_data_source.dart';
import 'feature/movie/data/repositories/movie_repository_impl.dart';
import 'feature/movie/domain/repositories/movie_repository.dart';
import 'feature/movie/presentation/bloc/latest_movies/latest_movies_bloc.dart';
import 'feature/movie/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'feature/movie/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'firebase_options.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Dio:
  sl.registerLazySingleton(() => Dio());

  /// Firebase:
  sl.registerSingleton<FirebaseAuthDataSource>(FirebaseAuthDataSource());
  sl.registerSingleton<FirebaseStorageDataSource>(FirebaseStorageDataSource());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl()));

  /// TMDB:
  sl.registerSingleton<MovieRemoteDataSource>(MovieRemoteDataSourceImpl(sl()));
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl(sl()));

  /// UseCases:
  /// * Auth
  sl.registerSingleton<SignInWithEmailAndPasswordUseCase>(SignInWithEmailAndPasswordUseCase(sl()));
  sl.registerSingleton<SignUpWithEmailAndPasswordUseCase>(SignUpWithEmailAndPasswordUseCase(sl()));
  sl.registerSingleton<SignOutUseCase>(SignOutUseCase(sl()));
  sl.registerSingleton<GetCurrentUserUseCase>(GetCurrentUserUseCase(sl()));
  sl.registerSingleton<SendRecoveryEmailUseCase>(SendRecoveryEmailUseCase(sl()));
  sl.registerSingleton<SignInWithGoogleUseCase>(SignInWithGoogleUseCase(sl()));
  sl.registerSingleton<SignInWithFacebookUseCase>(SignInWithFacebookUseCase(sl()));
  sl.registerSingleton<SignInWithAppleUseCase>(SignInWithAppleUseCase(sl()));
  sl.registerSingleton<ChangeDisplayNameUseCase>(ChangeDisplayNameUseCase(sl()));
  sl.registerSingleton<ChangeEmailUseCase>(ChangeEmailUseCase(sl()));
  sl.registerSingleton<ChangePasswordUseCase>(ChangePasswordUseCase(sl()));
  sl.registerSingleton<SendVerifyEmailUseCase>(SendVerifyEmailUseCase(sl()));
  sl.registerSingleton<ChangeProfilePhotoUseCase>(ChangeProfilePhotoUseCase(sl()));

  /// * Movie
  sl.registerSingleton<GetPopularMoviesUseCase>(GetPopularMoviesUseCase(sl()));
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase(sl()));
  sl.registerSingleton<SearchMoviesUseCase>(SearchMoviesUseCase(sl()));
  sl.registerSingleton<GetLatestMoviesUseCase>(GetLatestMoviesUseCase(sl()));

  /// BLoCs:
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory<PopularMoviesBloc>(() => PopularMoviesBloc(sl()));
  sl.registerFactory<SearchMoviesBloc>(() => SearchMoviesBloc(sl()));
  sl.registerFactory<TrendingMoviesBloc>(() => TrendingMoviesBloc(sl()));
  sl.registerFactory<LatestMoviesBloc>(() => LatestMoviesBloc(sl()));

}
