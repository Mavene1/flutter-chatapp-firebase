import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(icon: const Icon(Icons.logout), onPressed: logout)
          ],
        ),
        drawer: const MyDrawer());
  }
}
