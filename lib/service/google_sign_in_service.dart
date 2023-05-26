import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService{
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAuthentication?> signIn() async {
    try {
      // Trigger the authentication flow
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      debugPrint('email : ${googleUser?.email}');

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      return googleAuth;
    } catch (error) {
      debugPrint('googleSignIn error : ${error.toString()}');
      return null;
    }
  }

  Future<void> signOut() => _googleSignIn.disconnect();

}