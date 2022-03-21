
import 'package:cine_house/src/app/views/movie_details/movie_datails_screen.dart';
import 'package:cine_house/src/app/views/movie_list/movie_list_screen.dart';
import 'package:flutter/material.dart';

const String movieListRoute = '/';
const String movieDetailsRoute = '/movie-details';

class RouterDynamic {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case movieListRoute: return MaterialPageRoute(builder: (_) => const MovieListScreen(title: 'Movies'));
      case movieDetailsRoute: return MaterialPageRoute(builder: (_) => const MovieDetailsScreen());
      default: return MaterialPageRoute(builder: (_) => const Scaffold(
        body: Center(
          child: Text('Hola'),
        ),
      )
    );
  }
}
}

