class CounterState {
 int counterA = 0;
 int counterB = 0;
 int counterC = 0;
  CounterState(this.counterA,this.counterB,this.counterC);
}
// الحالات الخاصه بالصفحه

class IncrementState extends CounterState {
  IncrementState(super.counterA,super.counterB,super.counterC);
}

class DecrementState extends CounterState {
  DecrementState(super.counterA,super.counterB,super.counterC);
}
