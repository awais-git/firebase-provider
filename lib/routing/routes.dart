import 'package:firebase/auth/auth.dart';
import 'package:firebase/view/homepage.dart';
import 'package:firebase/view/login.dart';
import 'package:firebase/view/register.dart';
import 'package:firebase/view/reset_password.dart';
import 'package:flutter/material.dart';

const String auth = 'auth';
const String loginPage = 'login';
const String homepage = 'homepage';
const String register = 'register';
const String resetPassword = 'resetPassword';

Route<dynamic> generateRoutes(RouteSettings settings) {
  // final args = settings.arguments;
  switch (settings.name) {
    case auth:
      return MaterialPageRoute(
        builder: (context) => const Auth(),
      );
    case loginPage:
      return MaterialPageRoute(
        builder: (context) => const Login(),
      );
    case register:
      return MaterialPageRoute(
        builder: (context) =>  Register(),
      );
    case homepage:
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );

    case resetPassword:
      return MaterialPageRoute(
        builder: (context) =>  ResetPassword(),
      );
    default:
      throw ('This route does not exist');
  }
}
