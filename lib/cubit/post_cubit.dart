import 'dart:convert';

import 'package:bloc_statemanagement/cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(LoadingState());

  Future fetchPost() async {
    emit(LoadingState());   

    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      if (response.statusCode == 200) {
        final List posts = json.decode(response.body);
        emit(LoadedState(posts));   
      } else {
        emit(ErrorState("Failed with status code: ${response.statusCode}"));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

