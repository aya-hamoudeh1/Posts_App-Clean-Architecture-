import 'package:flutter/material.dart';

import '../../../../../core/app_theme.dart';

class FormSubmitBtn extends StatelessWidget {
  const FormSubmitBtn({
    super.key,
    required this.onPressed,
    required this.isUpdatePost,
  });

  final void Function() onPressed;
  final bool isUpdatePost;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: isUpdatePost ? Icon(Icons.edit) : Icon(Icons.add),
      label: Text(
        isUpdatePost ? 'Update' : 'Add',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
    );
  }
}
