import 'package:cine_house/src/core/exceptions.dart';
import 'package:cine_house/src/data/doubles/movies.dart';
import 'package:cine_house/src/data/models/moviemodel.dart';
import 'package:http/http.dart' as http; 

abstract class IMoviesRemoteDataSource {
  Future<MovieModel> requestMovie();  
}

class MoviesRemoteDataSource implements IMoviesRemoteDataSource{

  final http.Client client;

  MoviesRemoteDataSource(this.client);

  @override
  Future<MovieModel> requestMovie() async {
    var response = await client.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=%3C%3Capi_key%3E%3E&language=en-US&page=1'));
    if(response.statusCode != 200){
      return MovieModel.fromJson(jsonMovies);
    }
    throw ServerException();
  }

}