import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore
        .collection("Users")
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  //send message
  void sendMessage(String message) {}

  //get messages
}
