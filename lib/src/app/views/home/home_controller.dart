import 'package:cine_house/src/app/views/home/home_presenter.dart';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller{
  Movie? _movie;
  Movie? get movie => _movie;
  final HomePresenter homePresenter;

  HomeController(movieRepo)
  : homePresenter = HomePresenter(movieRepo), super();

  @override
  void initListeners() {
    homePresenter.getMovierOnNext = (Movie movie) {
      print(movie.toString());
      _movie = movie;
      refreshUI();
    };
    
    homePresenter.getMovieOnComplete = () {
      print('Lista  de peliculas.');
    };

    homePresenter.getMovieOnError = (e) {
      print('No se puede listar las peliculas.');
      ScaffoldMessenger.of(getContext()).showSnackBar(SnackBar(content: Text(e.message)));
      _movie = null;
      refreshUI();
    };
  }

  void getMovies() => homePresenter.getMovies();
  void getMoviewithError() => homePresenter.getMovies();

  void buttonPressed(){
    refreshUI();
  }

  @override
  void onResumed() => print('Ok');

  @override
  void onReassembled() => print('La vista está a punto de volver a montarse');

  @override
  void onDeactivated() => print('La vista está a punto de ser desactivada');

  @override
  void onDisposed(){
    homePresenter.dispose();
    super.onDisposed();
  }
}