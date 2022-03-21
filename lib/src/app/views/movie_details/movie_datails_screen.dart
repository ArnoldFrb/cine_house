import 'package:cine_house/src/app/views/movie_details/widgets/buttom_card.dart';
import 'package:cine_house/src/app/widgets/action_button.dart';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Result? result;
  const MovieDetailsScreen({Key? key, this.result}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  late bool favorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Detalle', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => setState((){favorite = !favorite;}), icon: favorite == true ? const Icon(Icons.favorite, color: Colors.black,) : const Icon(Icons.favorite_border, color: Colors.black,)),
        ],
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back, color: Colors.black,),),
      ),
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildMovieImage(size),
        const SizedBox(height: 20),
        _buildMovieTitle(),
        const SizedBox(height: 5),
        _buildMovieOriginalTitle(),
        const SizedBox(height: 30),
        _buildActions(),
        const SizedBox(height: 30),
        BottomCard(onPressed: () => {}, result: widget.result),
      ],
    ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        ActionButton(title: 'Fecha', value: widget.result!.releaseDate.toString()),
        ActionButton(title: 'Votacion', value: widget.result!.voteAverage.toString()),
        ActionButton(title: 'Popularidad', value: widget.result!.popularity.toString()),
      ],
    );
  }

  Widget _buildMovieOriginalTitle() {
    return Text(
      widget.result!.originalTitle,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  Widget _buildMovieTitle() {
    return  Text(
      widget.result!.title,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildMovieImage(Size size) {
    if (kIsWeb) {
      return Container(
        margin: const EdgeInsets.all(20),
        height: size.height * 0.33,
        width: size.width * 0.5,
        child: const Placeholder(),
      );
    } else {
      return Image(
        image: NetworkImage('https://image.tmdb.org/t/p/w185'+widget.result!.posterPath),
        height: size.height * 0.33,
      );
    }
  }
}