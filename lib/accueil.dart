import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/bloc/app_bloc.dart';
import 'package:untitled/comicvine_api.dart';
import 'package:untitled/movie_list.dart';
import 'package:untitled/serie_list.dart';

import 'bloc/app_events.dart';
import 'bloc/app_states.dart';
import 'comic_list.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = AppBloc(ComicVineRequests());
    appBloc.add(FetchMovies());
    final SerieBloc appBloc2 = SerieBloc(ComicVineRequests());
    appBloc2.add(FetchSeries());
    final ComicBloc appBloc3 = ComicBloc(ComicVineRequests());
    appBloc3.add(FetchComics());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => appBloc),
        BlocProvider(create: (context) => appBloc2),
        BlocProvider(create: (context) => appBloc3)
      ],
      child: Scaffold(
        backgroundColor: Color(0xFF15232E),
        body:
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Bienvenue !',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SvgPicture.asset(
                  'assets/svg/astronaut.svg',
                  height: 140,
                ),
              ],
            ),
            Expanded(child: ListView(
                children:[
                  SerieListBuilder(),

                  SizedBox(height: 15),
                  ComicListBuilder(),

                  SizedBox(height: 15),
                  MovieListBuilder(),
                SizedBox(height: 105),]),
            ) // Ajoutez d'autres sections si nécessaire
          ],
        ),

      ),

    );



  }
}