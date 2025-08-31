import 'package:bloc_statemanagement/cubit/post_cubit.dart';
import 'package:bloc_statemanagement/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<PostCubit>().fetchPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FETCH DATA FROM API")),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  subtitle: Text(state.posts[index]["title"]),
                  title: Text("${state.posts[index]["id"]}"),
                );
              },
            );
          } else if (state is ErrorState) {
            return InkWell(
              onTap: () {
                context.read<PostCubit>().fetchPost();
              },
              child: Text(state.message),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
