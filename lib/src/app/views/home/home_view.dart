import 'package:cine_house/src/data/services/movies_service.dart';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late Future<Movie> _movie;

  @override
  void initState() {
    super.initState();
    _movie = MoviesServices().fecthMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Movie>(
          future: _movie,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                padding: const EdgeInsets.all(20),
                itemCount: snapshot.data?.results.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = snapshot.data?.results[index];
                  return Container(
                    color: Colors.amber,
                    child: Text('${item?.title} \n${item?.overview}'),
                  );
                }
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      )
    );
  }
}