import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomeController extends ChangeNotifier{

Future logout () async {
  await FirebaseAuth.instance.signOut();
}
}