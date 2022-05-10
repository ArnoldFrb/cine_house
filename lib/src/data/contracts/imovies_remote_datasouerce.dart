
import 'package:cine_house/src/data/models/movie_model.dart';

abstract class IMoviesRemoteDataSource {
  Future<MovieModel> requestMovies();  
}