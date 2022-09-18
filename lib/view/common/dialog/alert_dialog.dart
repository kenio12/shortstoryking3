import 'package:flutter/material.dart';

showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String message,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => ConfirmDialog(
      title: title,
      content: content,
      message: message,
    ),
  );
}

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final String message;

  ConfirmDialog({
    required this.title,
    required this.content,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,style: TextStyle(fontSize: 20)),
      content: Text(content,style: TextStyle(fontSize: 20)),
      actions: [
        TextButton(
            child: Text(message,style: TextStyle(fontSize: 20),),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}
