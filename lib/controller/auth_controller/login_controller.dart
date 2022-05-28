import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/routing/routes.dart' as routes;

class LoginController extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController emailResetpass = TextEditingController();
  bool isPasswordVisible = false;

  //Login
  Future login(BuildContext context) async {
    try {
      isLoading = true;
       notifyListeners();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      showDialog(
          context: context,
          builder: (builder) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      Navigator.pushNamed(context, routes.homepage);
    } on FirebaseAuthException catch (e) {
      isLoading = false;
       notifyListeners();
      late String message;
      switch (e.code) {
        case 'invalid-email':
          message = 'Invalid Email';
          break;

        case 'user-disabled':
          message = "Your account is diasbled";
          break;

        case 'user-not-found':
          message = 'User not found';
          break;

        case 'wrong-password':
          message = "Wrong password";
      }

      showDialog(
          context: context,
          builder: (builder) {
            return AlertDialog(
              title: const Text('Login failed'),
              content: Text(message),
            );
          });
    } finally {
      isLoading = false;
       notifyListeners();
    }
   
  }

  //Reset password
  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailResetpass.text.trim(),
      );
    } catch (e) {
      print(e);
    }
  }

  isPassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
