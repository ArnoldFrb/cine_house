import 'package:cine_house/src/core/failure.dart';
import 'package:cine_house/src/domain/contracts/imovies_repository.dart';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

class GetMovies {
  final IMoviesRepository moviesRepository;
  
  GetMovies(this.moviesRepository);

  Future<Either<Failure, Movie>> call() async {
    return moviesRepository.getMovies();
  }
}