import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:movieroulette/blocs/trend_bloc.dart';
import 'package:movieroulette/blocs/trend_event.dart';
import 'package:movieroulette/blocs/trend_state.dart';
import 'package:movieroulette/widgets/random_container.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var ersun = "aa";
  List arda;

  @override
  Widget build(BuildContext context) {
    final _trendBloc = BlocProvider.of<TrendingBloc>(context);


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("aa"),
      ),
      body: BlocBuilder<TrendingBloc,TrendingState>(
        builder: (context,state){

          // ignore: missing_return
          if (state is TrendingLoadedState){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RandomContainer(state),


                RaisedButton(
                  child: Text(state.trending.results[1].title.toString()),
                  onPressed: () {
                    setState(() {

                    });
                    //getir();

                  },
                ),
              ],
            ),
          );
          }

        else if (state is TrendingLoadingState) {
          return CircularProgressIndicator();
        }
        else
         return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(

        backgroundColor: Colors.white,
        onPressed: (){ setState(() {

        });},
        tooltip: 'Increment',

        child: Icon(Icons.refresh,size: 20,color: Colors.black,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }




}
