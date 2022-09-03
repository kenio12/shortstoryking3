import 'package:flutter/material.dart';

showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => ConfirmDialog(
      title: title,
      content: content,
    ),
  );
}

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;

  ConfirmDialog({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,style: TextStyle(fontSize: 20)),
      content: Text(content,style: TextStyle(fontSize: 20)),
      actions: [
        TextButton(
            child: Text("でなおす",style: TextStyle(fontSize: 20),),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}
