import 'package:firebase/components/textfields.dart';
import 'package:firebase/controller/auth_controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/const.dart';
import '../utils/textstyle.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Provider.of<RegisterController>(context, listen: false);
    return Scaffold(
      body: LayoutBuilder(builder: (context, boxConstraints) {
        return SizedBox(
          height: boxConstraints.maxHeight,
          width: boxConstraints.maxWidth,
          child: Column(
            children: [
              const Spacer(),
              Text(
                'Register',
                style: mainHeading,
              ),
              const SizedBox(
                height: height_4,
              ),
              Consumer<RegisterController>(builder: (context, controller, _) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: horizontal),
                  child: textField(
                      controller: controller.nameController,
                      hintText: 'Name',
                      isPassword: false,
                      field: TextInputType.name),
                );
              }),
              const SizedBox(
                height: height_3,
              ),
              Consumer<RegisterController>(builder: (context, controller, _) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: horizontal),
                  child: textField(
                      controller: controller.emailController,
                      hintText: 'Email',
                      isPassword: false,
                      field: TextInputType.emailAddress),
                );
              }),
              const SizedBox(
                height: height_3,
              ),
              Consumer<RegisterController>(builder: (context, controller, _) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: horizontal),
                  child: textField(
                      controller: controller.passwordController,
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.isPassword();
                          },
                          icon: controller.isPasswordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      hintText: 'Password',
                      isPassword: controller.isPasswordVisible ? false : true,
                      field: TextInputType.visiblePassword),
                );
              }),
              const SizedBox(
                height: height_3,
              ),
              Consumer<RegisterController>(builder: (context, controller, _) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: horizontal),
                  child: textField(
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.isPassword();
                          },
                          icon: controller.isPasswordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      hintText: 'Confirm password',
                      isPassword: controller.isPasswordVisible ? true : false,
                      field: TextInputType.visiblePassword),
                );
              }),
              const Spacer(),
              Consumer<RegisterController>(builder: (context, controller, _) {
                return GestureDetector(
                  onTap: () {
                    controller.register();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    color: kPrimary,
                    height: 75,
                    child: Text(
                      'Register',
                      style: buttonText,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}
