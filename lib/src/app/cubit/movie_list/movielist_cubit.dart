import 'package:bloc/bloc.dart';
import 'package:cine_house/src/core/failure.dart';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:cine_house/src/domain/usecases/movie/get_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'movielist_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  final GetMovies getMovies;

  MovieListCubit(this.getMovies) : super(MovieListInitial());

  void getNewMovies() async {
    emit(MovieListLoading());
    final failureOrMovie = await getMovies();
    emit(_failureOrMovie(failureOrMovie));
  }

  MovieListState _failureOrMovie(Either<Failure, Movie> failureOrMovie){
    return failureOrMovie.fold(
      (failure) => MovieListError(_mapFailureToMessage(failure)), 
      (movie) => MovieListLoaded(movie)
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Ha ocurrido un error, por favor intentelo nuevamente.';
      default:
        return 'Unexpected error';
    }
  }
}