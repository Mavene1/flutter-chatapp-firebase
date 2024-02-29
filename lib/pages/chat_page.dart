import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEMail;

  const ChatPage({super.key, required this.receiverEMail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEMail),
      )
    );
  }
}
