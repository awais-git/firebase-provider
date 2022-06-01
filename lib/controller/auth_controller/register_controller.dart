import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;
  

  Future register(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      showDialog(
          context: context,
          builder: (builder) {
            return AlertDialog(
              title: Text('Account created Successfully'),
            );
          });
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      String? errorMessage;

      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'Email already registered';
          break;

        case 'invalid-email':
          errorMessage = "Invalid Email address";
          break;

        case 'operation-not-allowed':
          errorMessage = "Operation not allowed";
          break;

        case 'weak-password':
          errorMessage =
              'Weak password, please enter a strong password minimum 8 characters and combination of special characters,alphabets and numbers make it more strong';
      }

      showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Registeration failed!'),
            content: Text(errorMessage ?? ''),
          );
        },
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  isPassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  bool isConfirmPasswordVisibleFunc() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
    return isConfirmPasswordVisible;
  }

  //Email Validation
  bool isEmailValid() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailController.text);
  }
}
