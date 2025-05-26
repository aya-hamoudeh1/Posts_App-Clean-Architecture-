import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/post/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  const DeleteDialogWidget({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are You Sure ?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<AddDeleteUpdatePostBloc>(
              context,
            ).add(DeletePostEvent(postId: postId));
          },
          child: Text('Yes'),
        ),
      ],
    );
  }
}
