import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  Future register() async {
   try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
   }
   catch(e)
   {
     print(e);
   }
  }

  isPassword() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}
