import 'package:chatapp/components/my_usertile.dart';
import 'package:chatapp/pages/chat_page.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //retrieve chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();


  void logout() {
    final auth = AuthService();
    auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
          elevation: 0,
          actions: [
            IconButton(icon: const Icon(Icons.logout), onPressed: logout)
          ],
        ),
        drawer: const MyDrawer(),
        body: StreamBuilder(
            stream: _chatService.getUserStream(),
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
                children: snapshot.data!
                    .map<Widget>((e) => _buildUserListItem(e, context))
                    .toList(),
              );
            }));
  }

  Widget _buildUserListItem(Map<String, dynamic> e, BuildContext context) {
    //display all users except current user
    if(e["email"]!= _authService.currentUser()!.email) {
      return MyUserTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        receiverEMail: e["email"],
                        receiverID: e["uid"],
                      )));
        },
        text: e["email"]);
    }else {
      return Container();
    }
  }
}
