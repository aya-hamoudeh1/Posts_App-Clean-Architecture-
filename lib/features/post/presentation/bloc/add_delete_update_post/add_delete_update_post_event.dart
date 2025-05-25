part of 'add_delete_update_post_bloc.dart';

@immutable
sealed class AddDeleteUpdatePostEvent {}

class AddPostEvent extends AddDeleteUpdatePostEvent {
  final PostEntity post;

  AddPostEvent({required this.post});
  List<Object> get props => [post];
}

class UpdatePostEvent extends AddDeleteUpdatePostEvent {
  final PostEntity post;

  UpdatePostEvent({required this.post});
  List<Object> get props => [post];
}

class DeletePostEvent extends AddDeleteUpdatePostEvent {
  final int postId;

  DeletePostEvent({required this.postId});
  List<Object> get props => [postId];
}
