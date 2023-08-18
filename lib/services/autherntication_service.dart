// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  AuthenticationService._();

  static AuthenticationService? _instance;

  static AuthenticationService get instance {
    _instance ??= AuthenticationService._();
    return _instance!;
  }

  final auth = FirebaseAuth.instance;

  bool get isGoogleProvider {
    if (auth.currentUser!.providerData.isNotEmpty) {
      return auth.currentUser?.providerData.first.providerId == 'google.com';
    }
    return false;
  }

  Future<bool> isEmailInUse(String email) async {
    if (!email.contains('@') || email.split('.').length < 2) {
      print('invalid email');
      return false;
    }
    try {
      List<String> users = await auth.fetchSignInMethodsForEmail(email.trim());
      if (users.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<User?> logIn(String email, String password) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return credential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }

  Future<User?> signUp(String email, String password) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return credential.user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<UserCredential?> _signInUserWithCredential(GoogleAuthProvider googleAuthProvider) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await auth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> googleSignIn() async {
    try {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      final userCredential = await _signInUserWithCredential(authProvider);
      if (userCredential?.user != null) {
        return userCredential?.user;
      }
    } on FirebaseException catch (e) {
      print(e);
    }
    return null;
  }

  Stream<User?> authStates() {
    return auth.authStateChanges();
  }
}
