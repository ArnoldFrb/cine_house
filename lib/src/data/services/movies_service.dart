import 'dart:convert';
import 'package:cine_house/src/data/doubles/movies.dart';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:http/http.dart' as http;

class MoviesServices {
  Future<Movie> fecthMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=%3C%3Capi_key%3E%3E&language=en-US&page=1'), headers:{ "Accept": "application/json" });
    if(response.statusCode == 200){
      return Movie.fromJson(jsonDecode(response.body));
    }
    return Movie.fromJson(jsonMovies);
  }
}