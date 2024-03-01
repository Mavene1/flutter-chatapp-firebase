import 'package:chatapp/components/chat_bubble.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';

class ChatPage extends StatefulWidget {
  final String receiverEMail;
  final String receiverID;

  const ChatPage(
      {super.key, required this.receiverEMail, required this.receiverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //text controller
  final TextEditingController _message = TextEditingController();

  //auth and chat services
  final AuthService _authService = AuthService();

  final ChatService _chatService = ChatService();

  final ScrollController _scrollController = ScrollController();
  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
  
  //textfield focusnode
  FocusNode focusNode = FocusNode();
  //initialize

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 500), () {
          scrollDown();
        });
      }
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollDown();
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    _message.dispose();
    super.dispose();
  }

  //scroll controller
  

  void sendMessage() async {
    if (_message.text.isNotEmpty) {
      await _chatService.sendMessage(widget.receiverID, _message.text);
      _message.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        title: Text(widget.receiverEMail),
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
        stream: _chatService.getMessages(widget.receiverID, senderID),
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
            controller: _scrollController,
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildMessageListItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageListItem(DocumentSnapshot doc) {
    //get message data
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data["senderID"] == _authService.currentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    var margin = isCurrentUser
        ? const EdgeInsets.only(left: 50.0, right: 16.0)
        : const EdgeInsets.only(left: 16.0, right: 50.0);

    return Container(
        alignment: alignment,
        margin: margin,
        child: ChatBubble(
          message: data["message"],
          isCurrentUser: isCurrentUser,
        ));
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, right: 20.0),
      child: Row(
        children: [
          //message input
          Expanded(
            child: MyTextField(
              controller: _message,
              hintText: "Type a Message",
              obscureText: false,
              focusNode: focusNode,
            ),
          ),
          //send button
          Container(
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  sendMessage();
                },
                icon: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
