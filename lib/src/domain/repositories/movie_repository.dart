import 'package:cine_house/src/core/failure.dart';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepository{
  Future<Either<Failure, Movie>> getMovies();
}