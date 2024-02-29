import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //login
  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
          //save the user
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
      });
      return userCredential;
      
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'auth/invalid-credential') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'auth/invalid-password') {
        throw Exception('Wrong password provided for that user.');
      } else {
        throw Exception(e.message?.split(":").last.trim());
      }
    }
  }

  //register
  Future<UserCredential> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
          //save the user
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': userCredential.user!.email,
      });
      return userCredential;
      
    } on FirebaseAuthException catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  //logout
  Future<void> logout() async {
    return await _auth.signOut();
  }
  //get current user
  User? currentUser(){
    return _auth.currentUser;
  }

  //get user

  //get users

  //create user

  //delete user

  //update user

  //change password

  //reset password

  //send email

  //verify email
}
