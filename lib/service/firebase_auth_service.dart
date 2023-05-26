import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/service/google_sign_in_service.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignInService googleSignInService = GoogleSignInService();

  static final FirebaseAuthService _instance = FirebaseAuthService._internal();

  static FirebaseAuthService get instance => _instance;

  FirebaseAuthService._internal();



//  Login
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAuthentication? googleAuth =
          await googleSignInService.signIn();

      if (googleAuth != null) {
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential = await _auth.signInWithCredential(credential);
        return userCredential.user;
      } else {
        debugPrint("Cancelled By User");
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  // Sign Out
  Future signOut() async {
    try {
      await googleSignInService.signOut();
      _auth.signOut();
    } catch (e) {
      debugPrint("Error signing out");
      return null;
    }
  }

  User? get user => _auth.currentUser;

}
