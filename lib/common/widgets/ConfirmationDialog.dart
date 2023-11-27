import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String question;
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  ConfirmationDialog({
    required this.title,
    required this.question,
    required this.onYesPressed,
    required this.onNoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(question),
      actions: <Widget>[
        TextButton(
          onPressed: onNoPressed,
          child: const Text('خیر'),
        ),
        TextButton(
          onPressed: onYesPressed,
          child: const Text('بلی'),
        ),
      ],

      
    );
  }
}