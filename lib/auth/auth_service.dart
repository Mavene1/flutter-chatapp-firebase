import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //login
  Future<UserCredential> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }else {
        throw Exception('Something went wrong');
      }
    }
  }

  //register

  //logout
  Future<void> logout() async {
    return await _auth.signOut();
  }
  //get current user

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
