part of 'movielist_cubit.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object?> get props => [];
}

class MovieListInitial extends MovieListState { }

class MovieListLoading extends MovieListState { }

class MovieListLoaded extends MovieListState {
  final Movie movie;
  const MovieListLoaded(this.movie);

  @override
  List<Object?> get props => [movie];
}

class MovieListError extends MovieListState {
  final String message;
  const MovieListError(this.message);

  @override
  List<Object?> get props => [message];
}