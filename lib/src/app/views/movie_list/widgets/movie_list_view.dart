import 'package:cine_house/src/di/injection_container.dart';
import 'package:cine_house/src/app/cubit/movie_list/movielist_cubit.dart';
import 'package:cine_house/src/app/views/movie_list/widgets/movie_list_mobile.dart';
import 'package:cine_house/src/app/widgets/error_mesagge.dart';
import 'package:cine_house/src/app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_type_layout/screen_type_layout.dart';

class MovieListView extends StatelessWidget {
   const MovieListView({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieListCubit>(),
      child: BlocBuilder<MovieListCubit, MovieListState>(
        builder: (context, state) {
          if(state is MovieListInitial){
            _getMovies(context);
            return const LoadingIndicator();
          }
          if(state is MovieListLoaded){
            final movie = state.movie;
            return ScreenTypeLayout(
              mobile: MovieListMobile(
                results: movie.results,
                onPressed: null,
              )
            );
          }
          if(state is MovieListLoading){
            return const LoadingIndicator();
          }
          if(state is MovieListError){
            return ErrorMesagge(
              message: state.message,
              onPressed: () => _getMovies(context)
            );
          }
          return Container();
        }
      ),
    );
  }

  void _getMovies(BuildContext context) async {
    final movieListCubir = context.read<MovieListCubit>();
    movieListCubir.getNewMovies();
  }
}