import 'package:demo_bloc_counter_v1/bloc.dart';
import 'package:demo_bloc_counter_v1/counterpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (BuildContext context) => CounterBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(
        context); //! อยาก เอาblocมาใช้งานที่widgetนี้
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Container(
          height: 40,
          width: 320,
          child: ElevatedButton(
            onPressed: () {
              //!สั่งให้เปลี่ยนหน้า
              Navigator.of(context).push(
                MaterialPageRoute<CounterPage>(
                  builder: (context) {
                    return BlocProvider.value(
                      value: counterBloc,
                      child: CounterPage(),
                    );
                  },
                ),
              );
            },
            child: Text('GO TO Count PAGE'),
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 0,
              child: Icon(Icons.add),
              onPressed: () {
                counterBloc.add(Increment());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: 1,
              child: Icon(Icons.remove),
              onPressed: () {
                counterBloc.add(Decrement());
              },
            ),
          ),
        ],
      ),
    );
  }
}
