import 'package:firebase/components/textfields.dart';
import 'package:firebase/controller/auth_controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/const.dart';
import '../utils/textstyle.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
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
                // SizedBox(
                //   height: 100,
                //   width: 100,
                //   child: Container(
                //     color: Colors.red,
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(100),
                //       child: Stack(
                //         children: [
                //           Image(
                //             image: NetworkImage(
                //                 'https://images.unsplash.com/photo-1653858381366-7d1ec0b6b2d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60'),
                //             fit: BoxFit.cover,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
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
                        // validator: controller.isEmailValid,
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
                            controller.isConfirmPasswordVisibleFunc();
                          },
                          icon: controller.isConfirmPasswordVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        hintText: 'Confirm password',
                        isPassword:
                            controller.isConfirmPasswordVisible ? true : false,
                        field: TextInputType.visiblePassword),
                  );
                }),
                const Spacer(),
                Consumer<RegisterController>(builder: (context, controller, _) {
                  return GestureDetector(
                    onTap: () {
                      controller.register(context);
                    },
                    child: controller.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
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
      ),
    );
  }
}
