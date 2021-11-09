import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'swap_colors_box_event.dart';
part 'swap_colors_box_state.dart';

class SwapColorsBoxBloc extends Bloc<SwapColorsBoxEvent, SwapColorsBoxState> {
  SwapColorsBoxBloc() : super(BlueColor()) {
    on<BlueBox>((event, emit) {
      return emit(BlueColor());
    });
    on<RedBox>((event, emit) {
      return emit(RedColor());
    });
  }
}
// class DataBloc extends Bloc<DataEvent, DataState> {
//   DataBloc() : super(Initial()) {
//     on<FetchData>((event, emit) async {
//       emit(Loading());
//       await Future.delayed(Duration(seconds: 2));
//       emit(Success());
//     });
//   }
// }