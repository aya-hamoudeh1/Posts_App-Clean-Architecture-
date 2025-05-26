import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/post/domain/entities/post_entity.dart';
import 'package:posts_app/features/post/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:posts_app/features/post/presentation/widgets/post_add_update_page/text_form_field_widget.dart';

import 'form_submit_btn.dart';

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
          TextFormFieldWidget(
            controller: _titleController,
            multiLines: false,
            name: 'Title',
          ),

          /// Body TextField
          TextFormFieldWidget(
            controller: _bodyController,
            multiLines: true,
            name: 'Body',
          ),

          /// submit btn (add - update)
          FormSubmitBtn(
            onPressed: validateFormThenUpdateOrAddPost,
            isUpdatePost: widget.isUpdatePost,
          ),
        ],
      ),
    );
  }

  void validateFormThenUpdateOrAddPost() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final post = PostEntity(
        title: _titleController.text,
        body: _bodyController.text,
      );
      if (widget.isUpdatePost) {
        BlocProvider.of<AddDeleteUpdatePostBloc>(
          context,
        ).add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddDeleteUpdatePostBloc>(
          context,
        ).add(AddPostEvent(post: post));
      }
    }
  }
}
