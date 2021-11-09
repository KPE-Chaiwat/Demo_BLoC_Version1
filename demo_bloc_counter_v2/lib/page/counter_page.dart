import 'package:demo_bloc_counter_v2/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter_PAGE'),
      ),
      body: BlocBuilder<CounterBloc, int>(
        // builder: (context, count) {
        //   return Center(
        //     child: Text('$count'),
        //   );
        // },
        builder: (context, parin) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$parin'),
                const SizedBox(height: 30),
                const Multiplication()
              ],
            ),
          );
        },
      ),
    );
  }
}

class Multiplication extends StatelessWidget {
  const Multiplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Container(
      height: 40,
      width: 400,
      color: Colors.black,
      child: TextButton(
        child: const Text(
          "Multiplication",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          counterBloc.add(Multiplication_Double());
        },
      ),
    );
  }
}
