import 'package:chatapp/models/message.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get instance of auth
  final AuthService _authService = AuthService();

  //get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore
        .collection("Users")
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  //send message
  Future<void> sendMessage(String receiverID, message) async {
    //get current user info
    final String currentUserID = _authService.currentUser()!.uid;
    final String currentUserEmail = _authService.currentUser()!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create new message
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      message: message,
      receiverID: receiverID,
      timestamp: timestamp,
    );

    //construct chatroom id for the two users
    List<String> chatRoomIDs = [currentUserID, receiverID];
    //sort the list
    chatRoomIDs.sort();
    //create chatroom
    //add message to firestore
    await _firestore
        .collection("ChatRooms")
        .doc(chatRoomIDs.join("_"))
        .collection("Messages")
        .add(newMessage.toMap());
  }

  //get messages
  // ignore: unused_element
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    List<String> chatRoomIDs = [userID, otherUserID];
    //sort the list
    chatRoomIDs.sort();
    //create chatroom
    return _firestore
        .collection("ChatRooms")
        .doc(chatRoomIDs.join("_"))
        .collection("Messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
