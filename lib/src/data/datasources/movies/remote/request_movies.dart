import 'package:cine_house/src/core/exceptions.dart';
import 'package:cine_house/src/data/contracts/imovies_remote_datasouerce.dart';
import 'package:cine_house/src/data/models/movie_model.dart';
import 'package:http/http.dart' as http; 

class MoviesRemoteDataSource implements IMoviesRemoteDataSource{

  final http.Client client;
  MoviesRemoteDataSource(this.client);

  @override
  Future<MovieModel> requestMovies() async {
    var response = await client.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=41ad7ea4dd973638091cebfd44e63e9b&language=en-US&page=1'));
    if(response.statusCode == 200){
      return movieModelFromJson(response.body);
    }
    throw ServerException();
  }
}