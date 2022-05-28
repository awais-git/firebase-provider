import 'package:firebase/components/buttons.dart';
import 'package:firebase/components/textfields.dart';
import 'package:firebase/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/auth_controller/login_controller.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        title: const Text('Reset Password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<LoginController>(
            builder: (context, controller, _) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: horizontal),
                child: textField(
                    controller: controller.emailResetpass,
                    hintText: 'Enter the email',
                    isPassword: false,
                    field: TextInputType.emailAddress),
              );
            },
          ),
          const SizedBox(
            height: height_2,
          ),
          Consumer<LoginController>(builder: (context, controller, _) {
            return buttons(
                text: 'Reset',
                height: 60,
                width: 150,
                onTap: () {
                  controller.resetPassword;
                });
          })
        ],
      ),
    );
  }
}
