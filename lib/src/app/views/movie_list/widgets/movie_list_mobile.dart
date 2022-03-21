import 'package:cine_house/src/app/views/movie_details/movie_datails_screen.dart';
import 'package:cine_house/src/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieListMobile extends StatelessWidget {
  final List<Result> results;
  final VoidCallback? onPressed;

  const MovieListMobile({
    Key? key,
    required this.results,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage('https://placekitten.com/g/640/360'),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.4),
                      Colors.black.withOpacity(.2),
                    ]
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text("Cine House", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 30,),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amberAccent
                      ),
                      child: const Center(child: Text("Difruta en casa", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: results.map((item) => Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w185'+item.posterPath),
                        fit: BoxFit.cover
                      )
                    ),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(
                            result: item,
                          )
                        )
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(.6),
                              Colors.black.withOpacity(.2),
                            ]
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(item.title,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4,),
                            Text(item.overview,
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 10,)
                          ],
                        ),
                      ),
                    ),
                  ),
                )).toList(),
              )
            )
          ],
        ),
      ),
    );
  }
}