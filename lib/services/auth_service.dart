import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final userId = FirebaseAuth.instance.currentUser!.uid;

  final Logger _logger = Logger();


  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _logger.i("Logged in: ${credential.user?.email}");
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _logger.w('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _logger.w('Wrong password provided.');
      } else {
        _logger.e('Sign-in error: ${e.message}');
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

      _logger.i("Registered user: ${credential.user?.email}");
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _logger.w('Email already in use: $email');
        throw 'This email is already in use. Please use a different one.';
      } else if (e.code == 'invalid-email') {
        _logger.w('Invalid email format: $email');
        throw 'The email address is not valid.';
      } else if (e.code == 'weak-password') {
        _logger.w('Weak password used for registration.');
        throw 'The password is too weak. It should be at least 6 characters.';
      } else {
        _logger.e('Registration error: ${e.message}');
        throw e.message ?? 'An unknown error occurred.';
      }
    }
  }
}
