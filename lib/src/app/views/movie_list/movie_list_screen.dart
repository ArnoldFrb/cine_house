import 'package:cine_house/src/app/views/movie_list/widgets/movie_list_view.dart';
import 'package:flutter/material.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text('Home', style: TextStyle(color: Colors.black),),
        centerTitle: true,

      ),
      body: const MovieListView(),
      backgroundColor: Colors.white,
    );
  }
}