import 'package:firebase/controller/home_controller.dart';
import 'package:firebase/utils/const.dart';
import 'package:firebase/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase/routing/routes.dart' as routes;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        title: const Text('Homepage'),
        centerTitle: true,
        actions: [
          Consumer<HomeController>(
            builder: (context, controller, _) {
              return TextButton(
                onPressed: () {
                  controller.logout();
                  Navigator.pushReplacementNamed(context, routes.loginPage);
                },
                child: Text(
                  'Logout',
                  style: buttonText,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('The person login has email : ' + user.email!),
          )
        ],
      ),
    );
  }
}
