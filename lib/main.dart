import 'package:firebase/controller/auth_controller/google_signin_controller.dart';
import 'package:firebase/controller/auth_controller/register_controller.dart';
import 'package:firebase/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../routing/routes.dart' as route;
import 'controller/auth_controller/login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginController>(
            create: (context) => LoginController(),
          ),
          ChangeNotifierProvider<HomeController>(
            create: (context) => HomeController(),
          ),
          ChangeNotifierProvider<RegisterController>(
            create: (context) => RegisterController(),
          ),
          ChangeNotifierProvider<GoogleSigninController>(
            create: (context) => GoogleSigninController(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          onGenerateRoute: route.generateRoutes,
          initialRoute: route.auth,
        ),
      ),
    );
  }
}
