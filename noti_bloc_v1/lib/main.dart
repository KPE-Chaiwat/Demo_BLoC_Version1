import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noti_bloc_v1/bloc/data_bloc.dart';
import 'package:noti_bloc_v1/bloc/swap_colors_box_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => DataBloc(),
    //   child: MaterialApp(
    //     home: Home(),
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<DataBloc>(
            create: (BuildContext context) => DataBloc(),
          ),
          BlocProvider<SwapColorsBoxBloc>(
            create: (BuildContext context) => SwapColorsBoxBloc(),
          ),
        ],
        child: Home(),
      ),
    );
  }

  @override
  void dispose() {
    DataBloc().close();
    SwapColorsBoxBloc().close();
    super.dispose();
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle _styleText = TextStyle(color: Colors.white);
    final _dataBloc = BlocProvider.of<DataBloc>(context);
    final _swapColorsBoxBloc = BlocProvider.of<SwapColorsBoxBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: BlocListener<DataBloc, DataState>(
        listener: (context, state) {
          if (state is Success) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Success'),
              ),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SwapColorsBoxBloc, SwapColorsBoxState>(
                builder: (BuildContext context, SwapColorsBoxState state) {
              if (state is RedColor) {
                return Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                );
              }
              if (state is BlueColor) {
                return Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                );
                //return Center(child: CircularProgressIndicator());
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
            SizedBox(height: 30),
            BlocBuilder<DataBloc, DataState>(
                builder: (BuildContext context, DataState state) {
              if (state is Initial) {
                return Center(child: Text('Press the Button'));
              }
              if (state is Loading) {
                return Center(child: CircularProgressIndicator());
              } else {
                //state is Success
                return Center(child: Text('Success'));
              }
            }),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 100,
                  color: Colors.pink,
                  child: TextButton(
                    onPressed: () {
                      _dataBloc.add(FetchData());
                    },
                    child: Text("FetchData", style: _styleText),
                  ),
                ),
                SizedBox(width: 30),
                InkWell(
                  onTap: () {
                    _swapColorsBoxBloc.add(RedBox());
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    color: Colors.red,
                    child: Text(
                      "redBox",
                      style: _styleText,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _swapColorsBoxBloc.add(BlueBox());
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    color: Colors.blue,
                    child: Text("BlueBox", style: _styleText),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              _dataBloc.add(FetchData());
            },
          ),
        ],
      ),
    );
  }
}
