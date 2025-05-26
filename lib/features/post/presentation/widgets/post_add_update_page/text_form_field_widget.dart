import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.multiLines,
    required this.name,
  });

  final TextEditingController controller;
  final bool multiLines;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        controller: controller,
        minLines: multiLines ? 6 : 1,
        maxLines: multiLines ? 6 : 1,
        validator: (value) => value!.isEmpty ? '$name Cannot be empty!' : null,
        decoration: InputDecoration(hintText: name),
      ),
    );
  }
}
