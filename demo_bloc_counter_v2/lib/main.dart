import 'package:demo_bloc_counter_v2/bloc/counter_bloc.dart';
import 'package:demo_bloc_counter_v2/page/counter_page.dart';
import 'package:demo_bloc_counter_v2/page/home.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //!setup routes
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterBloc,
              child: HomePage(),
            ),
        '/counter': (context) => BlocProvider.value(
              value: _counterBloc,
              child: CounterPage(),
            ),
      },
    );
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }
}
