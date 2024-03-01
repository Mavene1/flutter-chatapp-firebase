import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/my_textfield.dart';

class ChatPage extends StatelessWidget {
  final String receiverEMail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEMail, required this.receiverID});

  //text controller
  final TextEditingController _message = TextEditingController();

  //auth and chat services
  final AuthService _authService = AuthService();
  final ChatService _chatService = ChatService();

  void sendMessage() async {
    if (_message.text.isNotEmpty) {
      _chatService.sendMessage(receiverID, _message.text);
      _message.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEMail),
      ),
      body: Column(
        children: [
          //display all the messages
          Expanded(child: _buildMessageList()),

          //message input
          _buildUserInput()
        ],
      ),
    );
  }

  //build message list
  Widget _buildMessageList() {
    String senderID = _authService.currentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error!"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildMessageListItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageListItem(DocumentSnapshot doc) {
    //get message data
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data["message"]);
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          //message input
          Expanded(
            child: MyTextField(
              controller: _message,
              hintText: "Type a Message",
              obscureText: false,
            ),
          ),
          //send button
          IconButton(
              onPressed: () {
                sendMessage();
              },
              icon: const Icon(Icons.arrow_upward))
        ],
      ),
    );
  }
}
