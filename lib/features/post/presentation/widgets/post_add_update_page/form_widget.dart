import 'package:flutter/cupertino.dart';
import 'package:posts_app/features/post/domain/entities/post_entity.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key, required this.isUpdatePost, this.post});

  final bool isUpdatePost;
  final PostEntity? post;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdatePost) {
      _titleController.text = widget.post!.title;
      _bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Title TextField
          /// Body TextField
          /// submit btn (add - update)
        ],
      ),
    );
  }
}
