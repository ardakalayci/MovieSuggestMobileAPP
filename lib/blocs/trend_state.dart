
import 'package:equatable/equatable.dart';
import 'package:movieroulette/model/trending.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();
}

class TrendingInitial extends TrendingState {
  @override
  List<Object> get props => [];
}

class TrendingLoadingState extends TrendingState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class TrendingLoadedState extends TrendingState {
  Trending trending;

  TrendingLoadedState({this.trending});

  @override
  List<Object> get props => [trending];
}

class TrendingErrorState extends TrendingState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}