import 'package:cine_house/src/app/router.dart';
import 'package:flutter/material.dart';
import 'package:cine_house/src/di/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cine House',
      onGenerateRoute: RouterDynamic.generateRoute,
      initialRoute: movieListRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


