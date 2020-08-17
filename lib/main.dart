import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieroulette/blocs/trend_bloc.dart';
import 'package:movieroulette/blocs/trend_event.dart';
import 'package:movieroulette/data/trend_repository.dart';
import 'package:movieroulette/ui/home.dart';

import 'blocs/trend_state.dart';


void main() {
  runApp(MyApp()


 );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

        return
         BlocProvider<TrendingBloc>(
            create: (_) => TrendingBloc()..add(AppStarted()),
            child: MaterialApp(
              home:  MyHomePage(),
            )
          );



  }
}
