import 'package:flutter/foundation.dart';
import 'package:todo_app/service/firebase_auth_service.dart';

class AuthProvider extends ChangeNotifier {
  Future<void> signInWithGoogle() async {
    await FirebaseAuthService.instance.signInWithGoogle();
  }

  Future<void> signOut() async {
    await FirebaseAuthService.instance.signOut();
  }
}
