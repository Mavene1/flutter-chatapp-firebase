import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const 
      EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? Colors.green
            : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(message, style: const TextStyle(color: Colors.white),),
    );
  }
}
