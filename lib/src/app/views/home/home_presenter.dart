import 'package:cine_house/src/domain/usecases/get_movie_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  Function? getMovieOnComplete;
  Function? getMovierOnNext;
  Function? getMovieOnError;

  final GetMovieUseCase getMovieUseCase;
  HomePresenter(moviesRepo) : getMovieUseCase = GetMovieUseCase(moviesRepo);

  void getMovies(){
    getMovieUseCase.execute(_GetMovieUseCaseObserver(this), null);
  }

  @override
  void dispose(){
    getMovieUseCase.dispose();
  }
}

class _GetMovieUseCaseObserver implements Observer<GetMovieUseCaseResponse> {
  final HomePresenter? presenter;
  _GetMovieUseCaseObserver(this.presenter);

  @override
  void onComplete(){
    assert(presenter?.getMovieOnComplete != null);
    presenter?.getMovieOnComplete!();
  }

  @override
  void onError(e){
    assert(presenter?.getMovieOnError != null);
    presenter?.getMovieOnError!(e);
  }

  @override
  void onNext(response){
    assert(presenter?.getMovierOnNext != null);
    presenter?.getMovierOnNext!(response);
  }
}

