import 'dart:async';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:cine_house/src/domain/repositories/movie_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetMovieUseCase extends UseCase<void, GetMovieUseCaseResponse> {
  final MoviesRepository _moviesRepository;
  GetMovieUseCase(this._moviesRepository);

  @override
  Future<Stream<GetMovieUseCaseResponse>> buildUseCaseStream(params) async {
    final controller = StreamController<GetMovieUseCaseResponse>();
    try{
      final movies = await _moviesRepository.getMovies();
      controller.add(GetMovieUseCaseResponse(movies));
      logger.finest('GetUserUseCase successful.');
      controller.close();
    }catch (e){
      logger.severe('GetUserUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetMovieUseCaseResponse {
  final Movie movies;
  GetMovieUseCaseResponse(this.movies);
}