import 'package:flutter/material.dart';
import 'package:posts_app/features/post/domain/entities/post_entity.dart';

import '../../../../../core/app_theme.dart';
import '../../pages/post_add_update_page.dart';

class UpdatePostBtnWidget extends StatelessWidget {
  const UpdatePostBtnWidget({super.key, required this.post});

  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PostAddUpdatePage(isUpdatePost: true, post: post),
          ),
        );
      },
      icon: Icon(Icons.edit, color: Colors.white),
      label: Text('Edit', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
    );
  }
}
