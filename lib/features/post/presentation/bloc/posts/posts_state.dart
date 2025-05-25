part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

class PostsInitial extends PostsState {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  final List<PostEntity> posts;

  LoadedPostsState({required this.posts});

  List<Object> get props => [posts];
}

class ErrorPostsState extends PostsState {
  final String message;

  ErrorPostsState({required this.message});

  List<Object> get props => [message];
}
