import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninController extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void googleSignin() async {
    try {
      final GoogleSignInAccount? _googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication? _googleSignInAuthentication =
          await _googleSignInAccount?.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: _googleSignInAuthentication!.accessToken,
        idToken: _googleSignInAuthentication.idToken,
      );

      await _firebaseAuth.signInWithCredential(authCredential);
    } catch (e) {
      // ignore: avoid_print
      print('error occured $e');
    }
  }
}
