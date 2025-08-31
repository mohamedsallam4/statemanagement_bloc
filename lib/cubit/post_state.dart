 import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  @override
  
  List<Object?> get props => [];

}

class LoadingState extends PostState {}

class LoadedState extends PostState {
  final List<dynamic> posts;
  LoadedState(this.posts);
  @override

  List<Object?> get props => [posts];

}

class ErrorState extends PostState {
  final String message;
  ErrorState(this.message);
  @override
  List<Object?> get props => [message];

}
