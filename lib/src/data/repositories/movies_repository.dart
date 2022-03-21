import 'package:cine_house/src/core/exceptions.dart';
import 'package:cine_house/src/core/failure.dart';
import 'package:cine_house/src/data/datasources/movies/remote_datasources.dart';
import 'package:cine_house/src/domain/contracts/imovies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:cine_house/src/domain/entities/movie.dart';

class MoviesRepository implements IMoviesRepository {
  final IMoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepository(this.moviesRemoteDataSource);

  @override
  Future<Either<Failure, Movie>> getMovies() async {
    try {
      final movie = await moviesRemoteDataSource.requestMovie();
      return Right(movie);
    } on ServerException {
      return const Left(ServerFailure(message: 'Ha ocurrido un error al obtnener los datos del servidor'));
    }
  }
}
