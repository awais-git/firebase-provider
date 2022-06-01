import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/routing/routes.dart' as routes;

class LoginController extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController emailResetpass = TextEditingController();
  bool isPasswordVisible = false;
  bool isRestPassword = false;

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
      Navigator.pushReplacementNamed(context, routes.homepage);
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
  Future resetPassword(BuildContext context) async {
    try {
      isRestPassword = true;
      notifyListeners();
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailResetpass.text.trim(),
      );
      isRestPassword = false;
      notifyListeners();
      showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Reset password email sent'),
          );
        },
      );
      print(emailResetpass.text);
    } on FirebaseException catch (e) {
      print(e);

      String? message;
      switch (e.code) {
        case 'auth/invalid-emai':
          message = 'Invalid Email';
          break;

        case 'uth/user-not-found':
          message = "email not exist";
          break;
      }
      showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Password reset failed'),
            content: Text(message ?? ''),
          );
        },
      );
    } finally {
      isRestPassword = false;
      notifyListeners();
    }
  }

  isPassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
