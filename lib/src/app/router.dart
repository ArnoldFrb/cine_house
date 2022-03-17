import 'package:cine_house/src/app/views/home/home_view.dart';
import 'package:flutter/material.dart';

const String homeRoute = '/';
const String signInRoute = '/sign-in';

class RouterDynamic {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case homeRoute: return MaterialPageRoute(builder: (_) => const HomePage(title: 'Hello world'));
      case signInRoute: return MaterialPageRoute(builder: (_) => const HomePage(title: 'Sign In'));
      default: return MaterialPageRoute(builder: (_) => const Scaffold(
        body: Center(
          child: Text('Hola'),
        ),
      )
    );
  }
}
}

