import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Logged in: ${credential.user?.email}");
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      } else {
        print('Error: ${e.message}');
      }
      return null;
    }
  }

  Future<User?> registerUser(String name, String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      await credential.user?.updateDisplayName(name);
      await credential.user?.reload();

      print("Registered user: ${credential.user?.email}");
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw 'This email is already in use. Please use a different one.';
      } else if (e.code == 'invalid-email') {
        throw 'The email address is not valid.';
      } else if (e.code == 'weak-password') {
        throw 'The password is too weak. It should be at least 6 characters.';
      } else {
        throw e.message ?? 'An unknown error occurred.';
      }
    }
  }

}
