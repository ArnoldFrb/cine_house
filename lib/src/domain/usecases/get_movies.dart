import 'package:cine_house/src/core/failure.dart';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:cine_house/src/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovies {
  final MoviesRepository moviesRepository;
  
  GetMovies(this.moviesRepository);

  Future<Either<Failure, Movie>> call() async {
    return moviesRepository.getMovies();
  }
}