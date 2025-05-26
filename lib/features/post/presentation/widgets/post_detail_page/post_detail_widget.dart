import 'package:flutter/material.dart';
import 'package:posts_app/features/post/domain/entities/post_entity.dart';
import 'package:posts_app/features/post/presentation/widgets/post_detail_page/update_post_btn_widget.dart';

import 'delete_post_btn_widget.dart';

class PostDetailWidget extends StatelessWidget {
  const PostDetailWidget({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            post.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Divider(height: 50),
          Text(post.body, style: TextStyle(fontSize: 16)),
          Divider(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdatePostBtnWidget(post: post),
              DeletePostBtnWidget(postId: post.id!),
            ],
          ),
        ],
      ),
    );
  }
}