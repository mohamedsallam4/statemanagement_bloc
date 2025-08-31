import 'package:bloc_statemanagement/cubit/post_cubit.dart';
import 'package:bloc_statemanagement/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return PostCubit();
      },

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Home(),
      ),
    );
  }
}
