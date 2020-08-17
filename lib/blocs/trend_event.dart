import 'package:equatable/equatable.dart';

abstract class TrendingEvent extends Equatable {
  const TrendingEvent();
  List<Object> get props => throw [];

}
class AppStarted extends TrendingEvent {

}
// ignore: must_be_immutable
class FetchTrendingEvent extends TrendingEvent {
  List<TrendingEvent> _servicesList = List<TrendingEvent>();

  @override
  // TODO: implement props
  List<Object> get props => [_servicesList];
}

class RefreshTrendingEvent extends TrendingEvent {


  @override
  // TODO: implement props
  List<Object> get props => [];
}