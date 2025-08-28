import 'package:bloc_statemanagement/Widget/home_com.dart';
import 'package:bloc_statemanagement/cubit/counter_cubit.dart';
import 'package:bloc_statemanagement/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            BlocListener<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.counterA > 5) {
                  showMyAlert(
                    context,
                    "تنبيه",
                    "يرجى الانتباه سيتم اعادة الكونتر للبدايه",
                  );
                }
              },

              child: Column(
                children: [
                  SizedBox(height: 20),
                  ButtonCounter(
                    icon: Icons.add,
                    onPressed: () {
                      context.read<CounterCubit>().incrementA();
                    },
                  ),
                  SizedBox(height: 8),
                  BlocSelector<CounterCubit, CounterState, int>(
                    selector: (state) => state.counterA,
                    builder: (context, counter) {
                      return TextCounter(
                        counter: counter,
                        color: counter > 0
                            ? Colors.green
                            : counter < 0
                            ? Colors.red
                            : Colors.black,
                      );
                    },
                  ),

                  SizedBox(height: 8),

                  ButtonCounter(
                    icon: Icons.remove,
                    onPressed: () {
                      context.read<CounterCubit>().decrementA();
                    },
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text("Show Value Of Counter A"),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: 20),
                ButtonCounter(
                  icon: Icons.add,
                  onPressed: () {
                    context.read<CounterCubit>().incrementB();
                  },
                ),
                SizedBox(height: 8),
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    if (state.counterB > 5) {
                      showMyAlert(context, "Are U Sure", "U will missed every thing");
                    }
                  },
                  builder: (context, counter) {
                    return TextCounter(
                      counter: counter.counterB,
                      color: counter.counterB > 0
                          ? Colors.green
                          : counter.counterB < 0
                          ? Colors.red
                          : Colors.black,
                    );
                  },
                ),

                SizedBox(height: 8),

                ButtonCounter(
                  icon: Icons.remove,
                  onPressed: () {
                    context.read<CounterCubit>().decrementB();
                  },
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text("Show Value Of Counter B"),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 20),
                ButtonCounter(
                  icon: Icons.add,
                  onPressed: () {
                    context.read<CounterCubit>().incrementC();
                  },
                ),
                SizedBox(height: 8),
                BlocSelector<CounterCubit, CounterState, int>(
                  selector: (state) => state.counterC,
                  builder: (context, counter) {
                    return TextCounter(
                      counter: counter,
                      color: counter > 0
                          ? Colors.green
                          : counter < 0
                          ? Colors.red
                          : Colors.black,
                    );
                  },
                ),

                SizedBox(height: 8),

                ButtonCounter(
                  icon: Icons.remove,
                  onPressed: () {
                    context.read<CounterCubit>().decrementC();
                  },
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text("Show Value Of Counter C"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showMyAlert(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // يقفل ال Dialog
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
