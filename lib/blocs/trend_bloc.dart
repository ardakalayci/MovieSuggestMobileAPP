import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movieroulette/blocs/trend_event.dart';
import 'package:movieroulette/blocs/trend_state.dart';
import 'package:movieroulette/data/data.dart';




class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  TrendRepository trendRepository = TrendRepository();

  TrendingBloc() : super(TrendingInitial());

  @override
  Stream<TrendingState> mapEventToState(TrendingEvent event) async* {
    if (event is AppStarted) {
      debugPrint("verigellioy");
      yield TrendingLoadingState();
      try {
        // Get city's weather details:
          final calledWeather = await trendRepository.getWeather();
          debugPrint("verigeldiioy");

          yield TrendingLoadedState(trending: calledWeather);

      } catch (e) {
        yield TrendingErrorState();
      }
    }
  }
}