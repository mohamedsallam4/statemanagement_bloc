import 'package:bloc/bloc.dart';
import 'package:bloc_statemanagement/cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0,0,0));
  incrementA() {
    emit(IncrementState(state.counterA+1,state.counterB,state.counterC));
  }
   decrementA() {
    emit(DecrementState(state.counterA-1,state.counterB,state.counterC));
  }
   incrementB() {
    emit(IncrementState(state.counterA,state.counterB+1,state.counterC));
  }
   decrementB() {
    emit(DecrementState(state.counterA,state.counterB-1,state.counterC));
  }
   incrementC() {
    emit(IncrementState(state.counterA,state.counterB,state.counterC+1,));
  }
   decrementC() {
    emit(DecrementState(state.counterA,state.counterB,state.counterC-1,));
  }
}
