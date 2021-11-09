import 'package:bloc/bloc.dart';
//*----------------------event------------------------------------------

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class Multiplication_Double extends CounterEvent {}

//*----------------------BLoC------------------------------------------

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(2) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
    on<Multiplication_Double>((event, emit) => emit(state * 2));
  }
}
