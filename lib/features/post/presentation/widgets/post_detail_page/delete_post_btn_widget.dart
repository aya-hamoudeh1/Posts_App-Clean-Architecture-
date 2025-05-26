import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/snack_bar_message.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import '../../pages/posts_page.dart';
import 'delete_dialog_widget.dart';

class DeletePostBtnWidget extends StatelessWidget {
  const DeletePostBtnWidget({super.key, required this.postId});

  final int postId;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => deleteDialog(context, postId),
      icon: Icon(Icons.delete_outline, color: Colors.white),
      label: Text('Delete', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
    );
  }

  void deleteDialog(BuildContext context, int postId) {
    showDialog(
      context: context,
      builder: (context) {
        return BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
          listener: (context, state) {
            if (state is MessageAddDeleteUpdatePostState) {
              SnackBarMessage().showSuccessSnackBar(
                message: state.message,
                context: context,
              );
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => PostsPage()),
                (route) => false,
              );
            } else if (state is ErrorAddDeleteUpdatePostState) {
              Navigator.of(context).pop();
              SnackBarMessage().showErrorSnackBar(
                message: state.message,
                context: context,
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingAddDeleteUpdatePostState) {
              return AlertDialog(title: LoadingWidget());
            }
            return DeleteDialogWidget(postId: postId);
          },
        );
      },
    );
  }
}
