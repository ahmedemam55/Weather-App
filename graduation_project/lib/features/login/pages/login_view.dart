import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/features/firebaseUtils.dart';
import 'package:graduation_project/services/snackers_service.dart';
import 'package:provider/provider.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/features/register/pages/register_view.dart';

import '../../layout_view.dart';
import '../../settings_provider.dart';

class LoginView extends StatelessWidget {
  static const String routeName = "login";

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var vm = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
          color: Color(0xFFDFECDB),
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Welcome back!",
                      textAlign: TextAlign.start,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(color: Colors.black, fontSize: 30),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "E-mail",
                      textAlign: TextAlign.start,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    CustomTextField(
                      controller: emailController,
                      hint: "Enter your e-mail address",
                      hintColor: Colors.black87,
                      suffixWidget: const Icon(Icons.email_rounded),
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter your e-mail address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Password",
                      textAlign: TextAlign.start,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    CustomTextField(
                      controller: passwordController,
                      isPassword: true,
                      maxLines: 1,
                      hint: "Enter your password",
                      hintColor: Colors.black87,
                      onValidate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "you must enter password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12.0),
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          // Try to login
                          bool success = await firebaseUtils().loginUserAccount(
                            emailController.text.trim(),
                            passwordController.text.trim()
                          );

                          if (success) {
                            SnackBarService.showSuccessMessage("Successfully logged in");
                            if (context.mounted) {
                              Navigator.pushReplacementNamed(
                                  context, LayoutView.routeName
                              );
                            }
                          } else {
                            // If it failed, the error message is already shown by firebaseUtils
                            print("Login failed - check device logs or SnackBar");
                          }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Login",
                            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),
                          ),
                           const Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "OR",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RegisterView.routeName,
                            );
                          },
                          child: Text(
                            "Create new account !",
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
