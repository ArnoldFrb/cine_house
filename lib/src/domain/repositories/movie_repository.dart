import 'package:cine_house/src/domain/entities/movie.dart';

abstract class MoviesRepository{
  Future<Movie> getMovies();
}