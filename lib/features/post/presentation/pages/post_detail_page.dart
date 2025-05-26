import 'package:flutter/material.dart';
import 'package:posts_app/features/post/domain/entities/post_entity.dart';

import '../widgets/post_detail_page/post_detail_widget.dart';

class PostDetailPage extends StatelessWidget {
  final PostEntity post;
  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Post Detail', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: PostDetailWidget(post: post),
      ),
    );
  }
}
