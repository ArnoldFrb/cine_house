import 'package:cine_house/src/app/cubit/movie_list/movielist_cubit.dart';
import 'package:cine_house/src/data/contracts/imovies_remote_datasouerce.dart';
import 'package:cine_house/src/data/datasources/movies/remote/request_movies.dart';
import 'package:cine_house/src/data/repositories/movies_repository.dart';
import 'package:cine_house/src/domain/contracts/imovies_repository.dart';
import 'package:cine_house/src/domain/usecases/movie/get_movies.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initInjection();
}

Future<void> initInjection() async {
  sl.registerFactory(() => MovieListCubit(sl()));
  sl.registerLazySingleton(() => GetMovies(sl()));  
  sl.registerLazySingleton<IMoviesRepository>(() => MoviesRepository(sl()));
  sl.registerLazySingleton<IMoviesRemoteDataSource>(() => MoviesRemoteDataSource(sl()));
  sl.registerLazySingleton(() => http.Client());
}