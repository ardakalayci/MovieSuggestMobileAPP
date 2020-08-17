import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieroulette/blocs/trend_bloc.dart';
import 'package:movieroulette/blocs/trend_event.dart';
import 'package:movieroulette/blocs/trend_state.dart';
import 'package:movieroulette/model/trending.dart';
import 'dart:math';

class RandomContainer extends StatefulWidget {

  var state;

  RandomContainer(this.state);

  @override
  _RandomContainerState createState() => _RandomContainerState();
}

class _RandomContainerState extends State<RandomContainer> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider<TrendingBloc>(
      create: (context) => TrendingBloc()..add(AppStarted()),
      child: Container(child: BlocBuilder<TrendingBloc, TrendingState>(
        builder: (context, state1) {
          Random random = new Random();
          if (state1 is TrendingLoadedState) {
            int randomNumber = random.nextInt(state1.trending.results.length);
            debugPrint(state1.trending.results[randomNumber].mediaType.toString());
            return RandomMovie(state1.trending.results[randomNumber]);
          }
          return CircularProgressIndicator();
        },
      )),
    );
  }

  Widget RandomMovie(state1) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network("https://image.tmdb.org/t/p/w500/"+state1.posterPath,width:width*3/5 ,))),
          ),
          SizedBox(
            height:height/20 ,
          ),
          Text(state1.title == null
              ? state1.name
              : state1.title,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
          Row(children: [
            Chip(
              backgroundColor: Colors.green,
              label: Text(state1.voteAverage.toString()),
            ),
            Chip(
              backgroundColor: Colors.green,
              label: Text(state1.mediaType.toString()=="MediaType.MOVIE" ? "Film":"Dizi"),
            )

          ],)
        ],
      ),
    );
  }
}
