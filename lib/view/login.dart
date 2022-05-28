import 'package:firebase/utils/textstyle.dart';
import 'package:flutter/material.dart';
import '../controller/auth_controller/login_controller.dart';
import '../utils/const.dart';
import '../components/textfields.dart';
import '../routing/routes.dart' as routes;
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../controller/auth_controller/google_signin_controller.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final googleSignInController =
        Provider.of<GoogleSigninController>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints contraints) {
          return SizedBox(
            height: contraints.maxHeight,
            child: Column(
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  child: Image(
                    image: AssetImage(authImage),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: height_4,
                ),
                Center(
                  child: Text(
                    'Login',
                    style: mainHeading,
                  ),
                ),
                const SizedBox(
                  height: height_3,
                ),
                Consumer<LoginController>(
                    builder: (context, loginController, _) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: horizontal),
                    child: textField(
                        controller: loginController.email,
                        hintText: 'Email',
                        isPassword: false,
                        field: TextInputType.visiblePassword),
                  );
                }),
                const SizedBox(
                  height: height_3,
                ),
                Consumer<LoginController>(
                    builder: (context, loginController, _) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: horizontal),
                    child: textField(
                        controller: loginController.password,
                        suffixIcon: IconButton(
                          onPressed: () {
                            loginController.password;
                          },
                          icon: loginController.isPasswordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                        hintText: 'Password',
                        isPassword:
                            loginController.isPasswordVisible ? false : true,
                        field: TextInputType.visiblePassword),
                  );
                }),
                Container(
                  alignment: Alignment.bottomRight,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, routes.resetPassword);
                    },
                    child: Text(
                      'Forget password',
                      style: smallText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: height_2,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, routes.register);
                  },
                  child: Text(
                    'Create an account',
                    style: mediumText,
                  ),
                ),
                Column(
                  children: [
                    SignInButton(
                      Buttons.GoogleDark,
                      onPressed: () async {
                        googleSignInController.googleSignin();
                      },
                    ),
                    SignInButton(
                      Buttons.AppleDark,
                      onPressed: () {},
                    ),
                    SignInButton(
                      Buttons.FacebookNew,
                      onPressed: () {},
                    ),
                  ],
                ),
                const Spacer(),
                Consumer<LoginController>(
                    builder: (context, loginController, _) {
                  return loginController.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GestureDetector(
                          onTap: () async {
                            await loginController.login(context);
                            loginController.password.clear();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            color: kPrimary,
                            height: 75,
                            child: Text(
                              'Login',
                              style: buttonText,
                            ),
                          ),
                        );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
